import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//preset for a textfield used in login and signup pages

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 42,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Color.fromARGB(255, 181, 181, 181)),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 117, 24))),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 181, 181, 181))),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            alignLabelWithHint: true,
          ),
        ),
      ),
    );
  }
}

class BetterTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const BetterTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.deepPurple)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 181, 181, 181))),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            alignLabelWithHint: true,
          ),
        ),
      ),
    );
  }
}
