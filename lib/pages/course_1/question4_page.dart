import 'package:flutter/material.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/option_box.dart';
import 'package:learning/pages/course_1/end_page.dart';
import 'package:learning/pages/course_1/video4_page.dart';

class Question4Page extends StatefulWidget {
  Question4Page({
    super.key,
  });

  @override
  State<Question4Page> createState() => _Question4PageState();
}

class _Question4PageState extends State<Question4Page> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int correctAnswerIndex = 3;
  List<String> answers = ['yes', 'most likely yes', 'most likely no', 'no'];

  bool get canPressNext => selectedAnswerIndex != null;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    if (selectedAnswerIndex == correctAnswerIndex) {
      score++;
    }
    setState(() {});
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
            'Should you try to trade if you have less pieces than your opponent?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
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
                              builder: (context) => Video4Page()));
                    },
                    canPressNext: true,
                    text: "Back",
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
                                    builder: (context) => EndPage()),
                              );
                            }
                          : null,
                      text: "Next",
                      canPressNext: canPressNext),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
