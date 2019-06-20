import 'package:flutter/material.dart';
import 'ScratchAndWin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scratch and win',
      theme: ThemeData.dark(),
      home: ScratchAndWin(),
    );
  }
}