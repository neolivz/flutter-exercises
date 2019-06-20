import 'package:flutter/material.dart';
import 'SpanishNumbers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Spanish Numbers',
       theme: ThemeData.light(),
       home: SpanishNumbers(),
    );
  }
}