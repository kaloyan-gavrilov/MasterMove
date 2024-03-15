import 'package:flutter/material.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/components/option_box.dart';
import 'package:learning/pages/course_1/video1_page.dart';
import 'package:learning/pages/course_1/video2_page.dart';
import 'package:learning/services/set_exp.dart';

class Question1Page extends StatefulWidget {
  Question1Page({
    super.key,
  });

  @override
  State<Question1Page> createState() => _Question1PageState();
}

class _Question1PageState extends State<Question1Page> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int correctAnswerIndex = 2;
  List<String> answers = ['Bishop', 'Queen', 'Rook', 'Pawn'];

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
            "What do you make a castle with?",
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
                      addExpToFirebase();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Video1Page()),
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
                                  builder: (context) => Video2Page()),
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
