import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Background'),
        ),
        body: HomePage(),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var colors = [
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.lightBlueAccent,
    Colors.deepOrangeAccent,
  ];
  var currentColor = Colors.white;

  setRandomColor() {
    var random = Random().nextInt(7);
    setState(() {
      currentColor = colors[random];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentColor,
      child: Center(
        child: RaisedButton(
          color: Colors.black,
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Text('Change It!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: setRandomColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());