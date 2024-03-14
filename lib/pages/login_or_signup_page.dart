import 'package:flutter/material.dart';
import 'package:learning/pages/login_page.dart';
import 'package:learning/pages/signup_page.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignupPage> {
  bool showLoginPage = true;

  //method for switching pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}
