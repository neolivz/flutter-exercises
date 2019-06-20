import 'package:flutter/material.dart';
import 'TicTacToe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: TicTacToe(),
      debugShowCheckedModeBanner: false,
    );
  }
}