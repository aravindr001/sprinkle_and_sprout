import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprinkle_and_sprout/constants/api_consts.dart';
import 'package:sprinkle_and_sprout/firebase_options.dart';
import 'package:sprinkle_and_sprout/screens/splash.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(apiKey: "AIzaSyC7IJPh1FjXiNpb-dvZGPfynghpKfVVt0g", appId: "1:519937790479:android:e1108594e61c419b68097a", messagingSenderId: "519937790479", projectId: "sprinkle-and-sprout-570f7")
  // );
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: const SplashScreen(),
    );
  }
}
