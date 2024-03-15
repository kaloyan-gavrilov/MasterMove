import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/video_player.dart';
import 'package:learning/pages/course_2/info_page.dart';
import 'package:learning/pages/course_2/question1_page.dart';

class Video11Page extends StatelessWidget {
  Video11Page({super.key});

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
                "https://www.youtube.com/watch?v=OCSbzArwB10&ab_channel=GothamChess"),
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
- Understanding the setup and movements of each chess piece is crucial for developing a strong foundation in chess. 
- Recognizing threats, capturing opportunities, and defending pieces are crucial skills that players need to develop. 
- Controlling the center of the board and understanding tactical patterns can give players an advantage in the middle game.
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Info2Page()));
                    },
                    text: "Back",
                    canPressNext: true,
                  ),
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
                              builder: (context) => Question11Page()));
                    },
                    text: "Next",
                    canPressNext: true,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
