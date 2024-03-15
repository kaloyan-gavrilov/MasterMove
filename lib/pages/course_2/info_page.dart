import 'package:flutter/material.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/course_2/video1_page.dart';
import 'package:learning/pages/home_page.dart';

class Info2Page extends StatelessWidget {
  Info2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade500,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NavBar()));
              },
              child: Icon(Icons.arrow_back)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/course2_tile_bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Info About Course",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  "Dive deep into complex strategic concepts like pawn structures, piece coordination, and positional sacrifices. Learn from seasoned masters through theoretical lessons and practical examples, sharpening your analytical skills and strategic intuition. Elevate your game and unleash your full potential on the chessboard with our comprehensive course.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 20,
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnotherButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Video11Page()));
                },
                text: "Next",
                canPressNext: true,
              ),
            ),
          ],
        ));
  }
}
