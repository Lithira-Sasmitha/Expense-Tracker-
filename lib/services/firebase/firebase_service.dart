import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  static bool _isInitialized = false;
  static bool get isInitialized => _isInitialized;

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  /// Initialize Firebase using credentials loaded from `.env`
  static Future<void> initialize() async {
    try {
      final options = DefaultFirebaseOptions.currentPlatform;
      
      // If the API key is empty or still placeholder, notify gracefully
      if (options.apiKey.isEmpty || options.apiKey.contains('YourApiKeyHere')) {
        debugPrint('⚠️ Firebase API key is not configured in .env. Skipping Firebase auto-init.');
        return;
      }

      await Firebase.initializeApp(
        options: options,
      );
      _isInitialized = true;
      debugPrint('✅ Firebase successfully initialized from .env');
    } catch (e) {
      debugPrint('❌ Error initializing Firebase: $e');
    }
  }

  // --- Authentication Helpers ---
  User? get currentUser => _isInitialized ? auth.currentUser : null;
  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<UserCredential?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (!_isInitialized) throw Exception('Firebase is not initialized. Check your .env file.');
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    if (!_isInitialized) throw Exception('Firebase is not initialized. Check your .env file.');
    return await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    if (_isInitialized) {
      await auth.signOut();
    }
  }

  // --- Firestore Helpers for Expenses ---
  CollectionReference<Map<String, dynamic>>? get expensesCollection {
    final user = currentUser;
    if (!_isInitialized || user == null) return null;
    return firestore.collection('users').doc(user.uid).collection('expenses');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? streamExpenses() {
    return expensesCollection?.orderBy('date', descending: true).snapshots();
  }

  Future<void> addExpense(Map<String, dynamic> expenseData) async {
    final col = expensesCollection;
    if (col == null) throw Exception('User not logged in or Firebase not initialized.');
    await col.add(expenseData);
  }

  Future<void> deleteExpense(String expenseId) async {
    final col = expensesCollection;
    if (col == null) return;
    await col.doc(expenseId).delete();
  }
}
