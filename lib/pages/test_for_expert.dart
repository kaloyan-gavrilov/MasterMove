import 'package:flutter/material.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/chess_levels.dart';

class test_for_expert_list extends StatelessWidget {
  test_for_expert_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Become an expert",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const Center(
            child: Text(
              'Chose course:',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: MyButton(
                text: "CHESS",
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Chess_levels()));
                }),
          ),
        ],
      ),
    );
  }
}
