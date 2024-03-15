import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/components/chess_puzzle.dart';
import 'package:learning/components/mybutton.dart';
import 'package:learning/pages/home_page.dart';

class Chess_levels extends StatefulWidget {
  Chess_levels({Key? key});

  @override
  State<Chess_levels> createState() => _Chess_level1State();
}

class _Chess_level1State extends State<Chess_levels> {
  int _currentIndex = 0;

  final List<Map<String, String>> items = [
    {'fen': 'r2r4/pp1R3p/2p2p2/2B1Pp1k/2b2P2/P7/1PP4P/1K4R1', 'mateIn': '1'},
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
    {'fen': '3nkr2/p1R2pp1/7p/5N2/1b6/1P5P/P4P2/6K1', 'mateIn': '1'},
    {'fen': '3R4/1q4pk/2b1p3/pn2P1P1/1p6/2p1B3/PPP5/2K3R1', 'mateIn': '1'},
    {'fen': '6k1/6p1/4nPNq/4P1NP/6K1/8/8/8', 'mateIn': '1'},
    {'fen': '2r1b3/2q1br2/ppn1pN1k/4p3/8/2PB2R1/P4PPP/6K1', 'mateIn': '1'},
    {'fen': '6q1/R2Q3p/1p1p1ppk/1P1N4/1P2rP2/6P1/7P/6K1', 'mateIn': '1'},
  ];

  void addToExperts(BuildContext context) {
    sendUserToFirebase();
    Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
  }

  Widget done(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'You have become an expert',
          style: TextStyle(fontWeight: FontWeight.w800),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnotherButton(
            onTap: () {
              addToExperts(context);
            },
            text: 'Navigate to Profile Page',
            canPressNext: true,
          ),
        ),
      ),
    );
  }

  void sendUserToFirebase() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .set({
      'type': 'expert',
    }, SetOptions(merge: true));
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
