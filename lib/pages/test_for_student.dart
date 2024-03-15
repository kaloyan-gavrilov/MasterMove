import 'package:flutter/material.dart';
import 'package:learning/components/chess_puzzle.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/home_page.dart';

class Test_for_student extends StatefulWidget {
  Test_for_student({Key? key});

  @override
  State<Test_for_student> createState() => Test_for_studentState();
}

class Test_for_studentState extends State<Test_for_student> {
  int _currentIndex = 0;

  final List<Map<String, String>> items = [
    {'fen': 'r4r1k/p4Pqp/1p6/3P2P1/1P6/P6Q/5PP1/B5KR', 'mateIn': '1'},
    {
      'fen': 'r1b2r1k/1p1n2b1/1np1pN1p/p7/3P4/qP2B3/2Q2PPP/2RR2K1',
      'mateIn': '1'
    },
    {'fen': 'r6k/2B5/6KN/8/8/8/p7/8', 'mateIn': '1'},
    {'fen': '1r5k/6p1/1r2B3/1ppP4/3b1R2/8/6PP/5R1K', 'mateIn': '1'},
    {'fen': '2k3nr/ppp2pp1/2q5/4p3/1P5p/P2QP3/4BPPP/3R2K1', 'mateIn': '1'},
    {'fen': 'rnbq3r/pppp2pp/1b6/8/1P2k3/8/PBPP1PPP/R2QK2R', 'mateIn': '1'},
  ];

  Widget done(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'You have done test',
          style: TextStyle(fontWeight: FontWeight.w800),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: AnotherButton(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavBar()));
          },
          text: 'Navigate to Profile Page',
          canPressNext: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex < items.length) {
      return ChessPuzzle(
        items: items.length,
        currentindex: _currentIndex,
        fen: items[_currentIndex]['fen']!,
        mateIn: int.parse(items[_currentIndex]['mateIn']!),
        onPuzzleSolved: () => setState(() {
          _currentIndex = _currentIndex + 1;
        }),
      );
    } else {
      return done(context);
    }
  }
}
