import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void get user => _auth.currentUser;

  Future createUser({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  Future loginUser({required String email, required password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future passwordRest({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (erorr) {
      return erorr.message;
    }
  }
}
