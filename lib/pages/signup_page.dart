import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/textfield.dart';
import 'package:learning/pages/home_page.dart';
import 'package:learning/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text editing controllers

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  //signup method
  void signUpUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.email)
            .set({
          'username': usernameController.text.split('@')[0],
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email
        });

        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorMessage("Passwords don't match");
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
  }

  //error message
  void showErrorMessage(String message) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        );
      },
    );
  }

  //sign in with google
  void _signInWithGoogle(BuildContext context) async {
    await AuthService().continueWithGoogle(context, 'signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          const SizedBox(height: 85),

          const SizedBox(height: 50),

          //SignUp text
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Sign Up",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        // color: Colors.grey[700],
                        fontSize: 48,
                      ),
                      fontWeight: FontWeight.w900)),
            ),
          ),

          //Sign Up to continue text
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text("Please sign up to continue",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                          ),
                          fontWeight: FontWeight.w300)))),

          const SizedBox(height: 30),

          //username text
          MyTextField(
            controller: usernameController,
            hintText: 'Username',
            obscureText: false,
          ),

          const SizedBox(height: 13),

          //email text
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 13),

          //password text
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(height: 13),

          //confirm password
          MyTextField(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),

          //sign in button
          MyButton(
            onTap: signUpUser,
            text: 'SIGN UP',
          ),

          //continue with text
          const SizedBox(height: 10),

          Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text('OR',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16),
                    )),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Divider(
                    color: Colors.black,
                    height: 36,
                  ),
                ),
              ),
            ],
          ),
          //google + apple

          GestureDetector(
            onTap: () => _signInWithGoogle(context),
            child: Container(
              width: 289,
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              margin: const EdgeInsets.only(top: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x2A000000),
                    blurRadius: 3,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/google.png',
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.54),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //register now
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a member?',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ))),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text('Log in',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline))),
                )
              ],
            ),
          )
        ]),
      ))),
    );
  }
}
