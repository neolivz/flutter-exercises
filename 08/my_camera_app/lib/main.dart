import 'package:flutter/material.dart';
import 'CameraHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Camera',
      theme: ThemeData.dark(),
      home: CameraHome(),
    );
  }
}