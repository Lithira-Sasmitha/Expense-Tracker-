import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Default [FirebaseOptions] configured dynamically via environment variables (.env).
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    final apiKey = dotenv.env['FIREBASE_API_KEY'] ?? '';
    final appId = dotenv.env['FIREBASE_APP_ID'] ?? '';
    final messagingSenderId = dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '';
    final projectId = dotenv.env['FIREBASE_PROJECT_ID'] ?? '';
    final storageBucket = dotenv.env['FIREBASE_STORAGE_BUCKET'];

    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      storageBucket: storageBucket,
    );
  }
}
