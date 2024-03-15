import 'package:flutter/material.dart';
import 'package:learning/pages/course_1/question_page.dart';
import 'package:learning/pages/course_1/video_page.dart';

class VideoOrQuestionPage extends StatefulWidget {
  final bool continueToQuestions;
  VideoOrQuestionPage({super.key, required this.continueToQuestions});

  @override
  State<VideoOrQuestionPage> createState() => _VideoOrQuestionPageState();
}

class _VideoOrQuestionPageState extends State<VideoOrQuestionPage> {
  //list of the videos and the questions
  int index = 0;

  final List<Map<String, dynamic>> sectionInfo = [
    //1
    {
      'videoURL':
          'https://www.youtube.com/watch?v=OCSbzArwB10&ab_channel=GothamChess',
      'description': '''
          - Understanding the setup and movements of each chess piece is crucial for developing a strong foundation in chess. 
          - Recognizing threats, capturing opportunities, and defending pieces are crucial skills that players need to develop. 
          - Controlling the center of the board and understanding tactical patterns can give players an advantage in the middle game.
        ''',
      'question': 'What do you make a castle with?',
      'answers': ['Bishop', 'Queen', 'Rook', 'Pawn'],
      'answerN': 4,
      'correctAnswer': 2,
    },

    //2
    {
      'videoURL':
          'https://www.youtube.com/watch?v=8IlJ3v8I4Z8&ab_channel=GothamChess',
      'description': '''
        - The video emphasizes the importance of pawn and piece development, as well as castling, during the opening phase of the game.
        - Setup-based openings, such as the Queen's Pawn London Opening or the King's Indian setup, offer a consistent approach regardless of how the opponent plays.
        ''',
      'question': 'Which set-up can basically "counter" all other set-ups?',
      'answers': ['London', 'Indian', 'French', 'center'],
      'answerN': 4,
      'correctAnswer': 1,
    },

    //3
    {
      'videoURL':
          'https://www.youtube.com/watch?v=7TAqSTZ6u5U&ab_channel=RemoteChessAcademy',
      'description': '''
        - Developing your pieces is crucial in the middle game, including bringing your queen into play and finding a secure square for it.
        - Opening up the position by advancing your central pawns is essential for creating attacking opportunities.
        - While the central pawn breakthrough is the most powerful strategy, alternative plans like pushing the f-pawn forward can also open up the position and lead to a strong attack.
        - Sacrificing pieces.
        ''',
      'question': 'Can there be a clear winner in the middle-game?',
      'answers': ['yes', 'most likely yes', 'most likely no', 'no'],
      'answerN': 4,
      'correctAnswer': 3,
    },

    //4
    {
      'videoURL':
          'https://www.youtube.com/watch?v=i_DTzmk5JVM&ab_channel=BotezLive',
      'description': '''
        - Trading in chess.
        - One movers can be detrimental as they often overlook the opponent's possible moves and tactics.
        - Time management in chess.
        - Understanding the opponent's intentions.
        ''',
      'question': 'Which is it better to have?',
      'answers': [
        'bishop & queen',
        'bishop & rook',
        'knight & rook',
        'knight & queen'
      ],
      'answerN': 4,
      'correctAnswer': 3,
    },
  ];

  void updateIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: whereToGo(widget.continueToQuestions, sectionInfo, index));
  }
}

whereToGo(continueOrNot, List<Map<String, dynamic>> sectionInfo, index) {
  if (!continueOrNot) {
    return VideoPage(
      videoURL: sectionInfo[index]['videoURL'],
      description: sectionInfo[index]['description'],
      index: index,
    );
  } else {
    return QuestionPage(
        question: sectionInfo[index]['question'],
        answers: sectionInfo[index]['answers'],
        answerN: sectionInfo[index]['answerN'],
        correctAnswer: sectionInfo[index]['correctAnswer'],
        index: index);
  }
}
