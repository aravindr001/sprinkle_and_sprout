
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprinkle_and_sprout/controllers/auth_controller.dart';

import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/screens/sign_in.dart';
import 'package:sprinkle_and_sprout/screens/splash.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.lazyPut(() => AuthController()); 
  // await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/login',
          page: () => SignInScreen(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
        ),

      ),
      home:  SplashScreen(),
    );
  }
}