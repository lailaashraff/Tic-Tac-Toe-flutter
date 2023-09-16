import 'package:flutter/material.dart';

import 'GameBoard.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player-screen';
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to XO'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Player 1 Name (X)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (text) {
                player1Name = text;
              },
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Player 2 Name (O)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (text) {
                player2Name = text;
              },
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(GameBoard.routeName,
                      arguments: GameBoardArgs(
                          player1Name: player1Name, player2Name: player2Name));
                },
                child: Text('Start Game'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
