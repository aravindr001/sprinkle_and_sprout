import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// import 'dart:io'; // Add this import for File checks

// Future<void> loadEnv() async {
//   final file = File('.env'); // Create a File instance
//   if (await file.exists()) {
//     // Check if the file exists
//     await DotEnv().load(fileName: ".env");
//   } else {
//     throw FileNotFoundError(); // Throw an error if not found
//   }
// }

String BASE_URL = "https://api.openai.com/v1";

// Retrieve the API key from the environment variable
// String API_KEY = dotenv.env['API_KEY'] ?? "defaultAPIkeyIfNotSet";

