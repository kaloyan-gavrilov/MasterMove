import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/components/textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  //password change function
  Future passowrdChange() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(
          context: context,
          builder: (context) {
            _emailController.clear();
            return AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Password change link send successfully! Check your email",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              backgroundColor: Colors.deepPurple,
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            _emailController.clear();
            return AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.message.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              backgroundColor: Colors.deepPurple,
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //text
          Text(
            "Enter Your Email and we will send you a password reset link.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500),
          ),

          const SizedBox(
            height: 20,
          ),

          //email textfield
          BetterTextField(
              controller: _emailController,
              hintText: "Email",
              obscureText: false),

          const SizedBox(
            height: 20,
          ),

          //button
          MaterialButton(
            onPressed: passowrdChange,
            color: Colors.deepPurple.shade300,
            child: Text(
              "Reset Password",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
