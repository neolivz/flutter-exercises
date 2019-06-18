import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {

  @override
  MyButtonState createState(){
    return MyButtonState();
  }

}

class MyButtonState extends State<MyButton  >{
  int counter = 0;
  List<String> spanishNumbers = [
    'uno',
    'dos',
    'tres',
    'cuatro',
    'cinco',
    'seis',
    'seite',
    'ocho',
    'nueve',
    'dietz'
  ];
  String defaultText = 'Spanish Numbers';

  void displaySpanishNumber (){
    setState(() {
      counter = counter + 1;
      defaultText = spanishNumbers[counter % 10];
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stateful WIdget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(defaultText, style: TextStyle(fontSize: 30.0,)),
              Padding(padding: EdgeInsets.all(10),),
              RaisedButton(
                child: Text('Call Numbers', style: TextStyle(color: Colors.white)),
                onPressed: displaySpanishNumber,
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      )
    );

  }
}