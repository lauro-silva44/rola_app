import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      log(emailAddress);
    } on FirebaseAuthException catch (e) {
      log(FirebaseAuthException(code: e.code).toString());
      if (e.code == 'user-not-found') {
        log(FirebaseAuthException(code: e.code).toString());
      } else if (e.code == 'wrong-password') {
        log(FirebaseAuthException(code: e.code).toString());
      }
    }
  }
}
