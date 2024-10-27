import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/screens/adduser_details.dart';
import 'package:sprinkle_and_sprout/screens/intro.dart';
import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/screens/sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isUserVerified = false.obs;
  Rx<User?> firebaseUser = Rx<User?>(null);
  RxString userName = ''.obs;
  RxString userAddress = ''.obs;
  RxInt userHouseholdCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.value = _auth.currentUser;
    checkUserVerification();
    checkAndFetchUserData();
  }

  Future<void> checkUserVerification() async {
    User? user = _auth.currentUser;
    if (user != null) {
      firebaseUser.value = user;
      if (user.emailVerified) {
        isUserVerified.value = true;
      }
    }
  }

  Future<void> checkAndFetchUserData() async {
    final uid = firebaseUser.value?.uid;
    if (uid == null) return;

    try {
      final doc = await _firestore.collection('users').doc(uid).get();

      if (!doc.exists ||
          doc.data()?['name'] == null ||
          doc.data()?['address'] == null ||
          doc.data()?['householdCount'] == null) {
        // Set the new user status in Firestore
        await setNewUserStatus(true);
        // Redirect to AddUserDetailsScreen if any detail is missing
        Get.to(() => AddUserDetailsScreen(uid: uid));
      } else {
        // Store data in observables for use in HomeScreen
        userName.value = doc.data()?['name'] ?? 'No Name';
        userAddress.value = doc.data()?['address'] ?? 'No Address';
        userHouseholdCount.value = doc.data()?['householdCount'] ?? 0;

        // Check if the user is marked as new
        if (doc.data()?['isNewUser'] == true) {
          // Redirect to IntroductionScreen if they are a new user
          Get.off(() => IntroductionScreen());
        } else {
          Get.off(() => HomePage());
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
      // Optionally, show a snackbar or handle the error further
    }
  }

  Future<void> setNewUserStatus(bool isNewUser) async {
    final uid = firebaseUser.value?.uid;
    if (uid == null) return;

    try {
      await _firestore.collection('users').doc(uid).set({
        'isNewUser': isNewUser,
      }, SetOptions(merge: true));
    } catch (e) {
      print("Error setting new user status: $e");
      // Handle error if necessary
    }
  }

  Future<void> updateUserDetails(
      String name, String address, int householdCount) async {
    final uid = firebaseUser.value?.uid;
    if (uid == null) return;

    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'address': address,
        'householdCount': householdCount,
        'isNewUser': false, // Mark user as not new after details are added
      });

      // Update observables to reflect the new data
      userName.value = name;
      userAddress.value = address;
      userHouseholdCount.value = householdCount;
    } catch (e) {
      print("Error updating user details: $e");
      // Handle error if necessary
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // Redirect to SignInScreen after signing out
      Get.offAll(() => SignInScreen());
    } catch (e) {
      print("Error signing out: $e");
      // Handle error if necessary
    }
  }
}
