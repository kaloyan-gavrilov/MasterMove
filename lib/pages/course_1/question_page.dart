import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final int answerN;
  final int index;
  QuestionPage(
      {super.key,
      required this.question,
      required this.answers,
      required this.correctAnswer,
      required this.answerN,
      required this.index});

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
            question,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        Option(
          answers: answers,
          index: 0,
        )
      ]),
    );
  }
}

class Option extends StatelessWidget {
  final int index;
  const Option({super.key, required this.answers, required this.index});

  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(answers[index],
              style: TextStyle(color: Colors.grey.shade500, fontSize: 20)),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade500)),
          )
        ],
      ),
    );
  }
}
