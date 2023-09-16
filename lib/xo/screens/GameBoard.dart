import 'package:flutter/material.dart';

import '../widgets/buttonBoard.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = 'game-board';
  int player1Score = 0;
  int player2Score = 0;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1Name} (X)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.player1Score}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player2Name} (O)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('${widget.player2Score}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonBoard(
                  text: boardState[0],
                  index: 0,
                  onButtonClick: onButtonClick,
                ),
                ButtonBoard(
                    text: boardState[1],
                    index: 1,
                    onButtonClick: onButtonClick),
                ButtonBoard(
                    text: boardState[2],
                    index: 2,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonBoard(
                    text: boardState[3],
                    index: 3,
                    onButtonClick: onButtonClick),
                ButtonBoard(
                    text: boardState[4],
                    index: 4,
                    onButtonClick: onButtonClick),
                ButtonBoard(
                    text: boardState[5],
                    index: 5,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonBoard(
                    text: boardState[6],
                    index: 6,
                    onButtonClick: onButtonClick),
                ButtonBoard(
                    text: boardState[7],
                    index: 7,
                    onButtonClick: onButtonClick),
                ButtonBoard(
                    text: boardState[8],
                    index: 8,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = 'X';
    } else {
      boardState[index] = 'O';
    }
    counter++;
    if (checkWinner('X')) {
      widget.player1Score += 5;
      initBoard();
    } else if (checkWinner('O')) {
      widget.player2Score += 5;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }

    setState(() {});
  }

  bool checkWinner(String symbol) {
    ///row
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    ///column
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    ///diagonal
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    setState(() {});
  }
}

class GameBoardArgs {
  String player1Name;
  String player2Name;

  GameBoardArgs({required this.player1Name, required this.player2Name});
}
