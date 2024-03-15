import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/video_player.dart';
import 'package:learning/pages/course_1/info_page.dart';
import 'package:learning/pages/course_1/video_or_question_page.dart';

class VideoPage extends StatelessWidget {
  final String videoURL;
  final String description;
  final index;
  VideoPage(
      {super.key,
      required this.videoURL,
      required this.description,
      required this.index});

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
        VideoPlayer(url: videoURL),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(255, 117, 24, 0.7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            description,
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
                        if (index == 0) {
                          debugPrint("button pressed");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPage()));
                        }
                      },
                      text: "Back"),
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
                              builder: (context) => VideoOrQuestionPage(
                                    continueToQuestions: true,
                                  )));
                    },
                    text: "Next",
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
