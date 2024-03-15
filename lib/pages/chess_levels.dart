import 'package:flutter/material.dart';
import 'package:learning/components/chess_puzzle.dart';

class Chess_levels extends StatefulWidget {
  Chess_levels({Key? key});

  @override
  State<Chess_levels> createState() => _Chess_level1State();
}

class _Chess_level1State extends State<Chess_levels> {
  int _currentIndex = 0;

  final List<Map<String, String>> items = [
    {'fen': '3r2rk/p5pp/1p4n1/3p2N1/2pP4/2P1R3/qPBQ1PPP/6K1', 'mateIn': '1'},
    {'fen': 'kr6/1p6/p7/4b3/8/8/1P4BP/R6K', 'mateIn': '1'},
    {
      'fen': 'r1b2rk1/pp3pp1/2nbpq1p/2pp2N1/3P3P/2P1P3/PPQ2PP1/RN2KB1R',
      'mateIn': '1'
    },
    {
      'fen': 'r1b2b1r/pp3Qp1/2nkn2p/3ppP1p/P1p5/1NP1NB2/1PP1PPR1/1K1R3q',
      'mateIn': '1'
    },
    {'fen': 'kbK5/pp6/1P6/8/8/8/8/R7', 'mateIn': '2'},
    {'fen': '8/8/8/2P3R1/5B2/2rP1p2/p1P1PP2/RnQ1K2k', 'mateIn': '2'},
    {'fen': '8/8/2Q5/3B4/1K6/2P5/Nk6/2R5', 'mateIn': '2'},
    {'fen': '1B2q1B1/2n1kPR1/R1b2n1Q/2p1r3/8/3Q2B1/4p3/4K3', 'mateIn': '2'},
    {'fen': '8/p4p2/Q7/3P4/1p1kB3/1K4N1/5R2/8', 'mateIn': '2'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple chess board Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChessPuzzle(
          fen: items[_currentIndex]['fen']!,
          mateIn: int.parse(items[_currentIndex]['mateIn']!),
          onPuzzleSolved: () => setState(() {
            _currentIndex = _currentIndex + 1;
          }),
        ));
  }
}
