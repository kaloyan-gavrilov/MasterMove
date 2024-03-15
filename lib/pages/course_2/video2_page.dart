import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/video_player.dart';
import 'package:learning/pages/course_1/question1_page.dart';
import 'package:learning/pages/course_1/question2_page.dart';

class Video22Page extends StatelessWidget {
  Video22Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Video",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        VideoPlayer(
            url:
                "https://www.youtube.com/watch?v=u8MKyE9Qt8I&ab_channel=GothamChess"),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
            '''
- The video emphasizes the importance of pawn and piece development, as well as castling, during the opening phase of the game.
- Setup-based openings, such as the Queen's Pawn London Opening or the King's Indian setup, offer a consistent approach regardless of how the opponent plays.
        ''',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
            child: SizedBox(
          height: 10,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: AnotherButton(
                      onTap: () {
                        debugPrint("button pressed");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question1Page()));
                      },
                      text: "Back",
                      canPressNext: true),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AnotherButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Question2Page()));
                      },
                      text: "Next",
                      canPressNext: true),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
