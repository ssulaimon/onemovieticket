import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticateUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void get user => _auth.currentUser;
  String? userName() {
    if (_auth.currentUser?.displayName == null) {
      return 'Please update your account';
    } else {
      return _auth.currentUser?.displayName;
    }
  }

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

  Future googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuthProvider =
          await googleSignIn?.authentication;

      var credentials = GoogleAuthProvider.credential(
          idToken: googleAuthProvider?.idToken,
          accessToken: googleAuthProvider?.accessToken);
      return await FirebaseAuth.instance.signInWithCredential(credentials);
    } catch (erorr) {
      log(erorr.toString());
    }
  }

  Future googleLooutUser() async {
    return await GoogleSignIn().signOut();
  }

  Future facebookLogin() async {
    try {
      LoginResult? loginResult = await FacebookAuth.instance.login();
      OAuthCredential? authCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return FirebaseAuth.instance.signInWithCredential(authCredential);
    } catch (e) {
      return log(e.toString());
    }
  }

  Future logoutFacebookAcc() async {
    return await FacebookAuth.instance.logOut();
  }

  Future signoutUser() async {
    return await FirebaseAuth.instance.signOut();
  }
}
