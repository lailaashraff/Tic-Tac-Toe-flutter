import 'package:flutter/material.dart';
import 'package:tictactoe/xo/screens/GameBoard.dart';
import 'package:tictactoe/xo/screens/PlayerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PlayerScreen.routeName,
      routes: {
        GameBoard.routeName: (context) => GameBoard(),
        PlayerScreen.routeName: (context) => PlayerScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
