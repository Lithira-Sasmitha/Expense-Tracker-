import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/app.dart';
import 'services/firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables from .env
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Could not load .env file: $e');
  }

  // Initialize Firebase with loaded .env credentials
  await FirebaseService.initialize();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ExpenseTrackerApp());
}
