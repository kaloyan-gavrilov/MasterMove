import 'package:flutter/material.dart';
import 'package:learning/pages/home_page.dart';
import 'package:simple_chess_board/models/board_arrow.dart';
import 'package:chess/chess.dart' as chesslib;
import 'package:simple_chess_board/simple_chess_board.dart';

class ChessPuzzle extends StatefulWidget {
  const ChessPuzzle(
      {super.key,
      required this.items,
      required this.currentindex,
      required this.fen,
      required this.mateIn,
      required this.onPuzzleSolved});

  final int items;
  final int currentindex;
  final String fen;
  final int mateIn;
  final Function onPuzzleSolved;

  @override
  State<ChessPuzzle> createState() => _ChessPuzzleState();
}

class _ChessPuzzleState extends State<ChessPuzzle> {
  late chesslib.Chess _chess;
  int moveDone = 0;
  int isPlayerTurn = 1;

  BoardArrow? _lastMoveArrowCoordinates;

  void tryMakingMove({required ShortMove move}) {
    final success = _chess.move(<String, String?>{
      'from': move.from,
      'to': move.to,
      'promotion': move.promotion?.name,
    });
    if (success) {
      print('Move done: $moveDone');
      print('Mate in${widget.mateIn}');
      moveDone = moveDone + 1;
      if (moveDone == widget.mateIn) {
        if (_chess.game_over) {
          moveDone = 0;
          widget.onPuzzleSolved();
        } else {
          for (; moveDone != 0; moveDone--) {
            _chess.undo_move();
            setState(() {
              _lastMoveArrowCoordinates = null;
            });
            print('object');
          }
        }
      } else {
        setState(() {
          _lastMoveArrowCoordinates = BoardArrow(from: move.from, to: move.to);
        });
      }
    }
  }

  Future<PieceType?> handlePromotion(BuildContext context) {
    final navigator = Navigator.of(context);
    return showDialog<PieceType>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Promotion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Queen"),
                onTap: () => navigator.pop(PieceType.queen),
              ),
              ListTile(
                title: const Text("Rook"),
                onTap: () => navigator.pop(PieceType.rook),
              ),
              ListTile(
                title: const Text("Bishop"),
                onTap: () => navigator.pop(PieceType.bishop),
              ),
              ListTile(
                title: const Text("Knight"),
                onTap: () => navigator.pop(PieceType.knight),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (moveDone == 0) {
      _chess = chesslib.Chess.fromFEN('${widget.fen} w - - 0 1');
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Test ${widget.currentindex + 1}/${widget.items}',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (NavBar())));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SimpleChessBoard(
            chessBoardColors: ChessBoardColors(),
            engineThinking: false,
            fen: _chess.fen,
            onMove: tryMakingMove,
            blackSideAtBottom: false,
            whitePlayerType: PlayerType.human,
            blackPlayerType: PlayerType.human,
            lastMoveToHighlight: _lastMoveArrowCoordinates,
            onPromote: () => handlePromotion(context),
            onPromotionCommited: ({
              required ShortMove moveDone,
              required PieceType pieceType,
            }) {
              moveDone.promotion = pieceType;
              tryMakingMove(move: moveDone);
            },
          ),
        ),
      ),
    );
  }
}
