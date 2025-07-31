import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(name);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Signup error: ${e.toString()}');
      return null;
    }
  }
}
