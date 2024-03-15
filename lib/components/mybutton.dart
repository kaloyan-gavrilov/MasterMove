import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//login and signup button preset for easy access

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 10),
          height: 40,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0x42FF7518), Color(0xFFFF7518)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Center(
              child: Text(
            text,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900)),
          )),
        ));
  }
}

class AnotherButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const AnotherButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 229, 205, 233),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Text(
            text,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
          )),
        ));
  }
}
