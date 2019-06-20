import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class SpanishNumbers extends StatefulWidget {
  @override
  _SpanishNumbersState createState() => _SpanishNumbersState();
}

class _SpanishNumbersState extends State<SpanishNumbers> {
  AudioCache audioCache = AudioCache();
  List<NumberAudio> numbers = [
    NumberAudio('one.wav', Colors.red, "One"),
    NumberAudio('two.wav', Colors.red, "Two"),
    NumberAudio('three.wav', Colors.red, "Three"),
    NumberAudio('four.wav', Colors.red, "Four"),
    NumberAudio('five.wav', Colors.red, "Five"),
    NumberAudio('six.wav', Colors.red, "Six"),
    NumberAudio('seven.wav', Colors.red, "Seven"),
    NumberAudio('eight.wav', Colors.red, "Eight"),
    NumberAudio('nine.wav', Colors.red, "Nine"),
    NumberAudio('ten.wav', Colors.red, "Ten"),
  ];

  play(String uri) {
    audioCache.play(uri);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spanish Number'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('images/logo.png'),),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0
                ),
                itemCount: numbers.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: numbers[i].buttonColor,
                    child: Text(numbers[i].buttonText),
                    onPressed: (){
                      play(numbers[i].audioUri);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}