import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:learning/pages/home_page.dart';

class AuthService {
  Future<void> continueWithGoogle(
      BuildContext context, String loginOrSingUp) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // User canceled the sign-in process
        return;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      // Sign in with Firebase
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the user's username (First part of email)
      final String username = userCredential.user!.email!.split('@')[0];

      // Store user information in Firestore
      if (loginOrSingUp == "signup") {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.email)
            .set({
          'username': username,
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email
        });
      }

      // Navigate to HomePage after successful sign-in
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(
        //     builder: (context) =>
        //         HomePage(user: FirebaseAuth.instance.currentUser)),
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }
}
