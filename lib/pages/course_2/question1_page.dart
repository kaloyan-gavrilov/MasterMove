import 'package:flutter/material.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/option_box.dart';
import 'package:learning/pages/course_2/video1_page.dart';
import 'package:learning/pages/course_2/video2_page.dart';

class Question11Page extends StatefulWidget {
  Question11Page({
    super.key,
  });

  @override
  State<Question11Page> createState() => _Question11PageState();
}

class _Question11PageState extends State<Question11Page> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int correctAnswerIndex = 3;
  List<String> answers = [
    'bishop & queen',
    'bishop & rook',
    'knight & rook',
    'knight & queen'
  ];

  bool get canPressNext => selectedAnswerIndex != null;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      if (selectedAnswerIndex == correctAnswerIndex) {
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Question",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            "Which is it better to have?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: selectedAnswerIndex == null
                    ? () => pickAnswer(index)
                    : null,
                child: Option(
                  currentIndex: index,
                  answer: answers[index],
                  isSelected: selectedAnswerIndex == index,
                  selectedAnswerIndex: selectedAnswerIndex,
                  correctAnswerIndex: correctAnswerIndex,
                ),
              );
            },
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 10,
          ),
        ),
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
                        MaterialPageRoute(builder: (context) => Video11Page()),
                      );
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
                    onTap: canPressNext
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Video22Page()),
                            );
                          }
                        : null,
                    text: "Next",
                    canPressNext:
                        canPressNext, // Change color based on condition
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
