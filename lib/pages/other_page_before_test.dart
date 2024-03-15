import 'package:flutter/material.dart';
import 'package:learning/pages/test_for_student.dart';

class PageBeforeTest extends StatefulWidget {
  PageBeforeTest({super.key});

  @override
  State<PageBeforeTest> createState() => PageBeforeTestState();
}

class PageBeforeTestState extends State<PageBeforeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Solve each puzzle become an expert",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),

          //button to continue
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Test_for_student()));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text("Continue to test",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700)),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
