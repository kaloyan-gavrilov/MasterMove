import 'package:flutter/material.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/course_1/video_or_question_page.dart';
import 'package:learning/pages/home_page.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade500,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NavBar()));
              },
              child: Icon(Icons.arrow_back)),
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
                  color: Color.fromRGBO(149, 165, 166, 0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Join our beginner's course, 'Basics of Chess', and unlock the secrets of the game from the ground up. Explore the chessboard, learn piece movement, and discover basic tactics and opening principles.",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoOrQuestionPage(
                                  continueToQuestions: false,
                                )));
                  },
                  text: "Next"),
            ),
          ],
        ));
  }
}
