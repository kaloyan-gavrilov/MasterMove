import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/video_player.dart';
import 'package:learning/pages/course_1/question3_page.dart';
import 'package:learning/pages/course_1/question4_page.dart';

class Video4Page extends StatelessWidget {
  Video4Page({super.key});

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
                'https://www.youtube.com/watch?v=i_DTzmk5JVM&ab_channel=BotezLive'),
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
- Material advantage plays a crucial role in the endgame, so avoiding or seeking trades accordingly can be decisive.
- Creating a passed pawn is a valuable strategy as it increases the chances of promoting to a higher-value piece.
- Utilizing pawn majority.
- The square rule.
- The king in the endgame.
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
                                builder: (context) => Question3Page()));
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
                                builder: (context) => Question4Page()));
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
