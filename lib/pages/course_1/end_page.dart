import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/home_page.dart';

class EndPage extends StatelessWidget {
  EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Text(
          "Congratulations!",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                // color: Colors.black.withOpacity(0.3),
                color: Colors.deepPurple.shade400,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            "Thank you for choosing this course! You can now continue with the other courses or check your knowledge in the test tabs.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: SizedBox(
          height: 10,
        )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AnotherButton(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NavBar()));
              },
              text: "Finish course",
              canPressNext: true),
        ),
      ],
    ));
  }
}
