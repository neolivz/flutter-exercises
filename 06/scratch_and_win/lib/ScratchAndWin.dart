import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ScratchAndWin extends StatefulWidget {
  @override
  _ScratchAndWinState createState() => _ScratchAndWinState();
}

class _ScratchAndWinState extends State<ScratchAndWin> {
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  List<String> itemArray;
  int luckyNumber;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  generateRandomNumber() {
    setState(() {
      luckyNumber = Random().nextInt(25);
    });
  }

  resetGame(){
    setState(() {
      itemArray = List<String>.filled(25, 'empty');
    });
    generateRandomNumber();
  }

  AssetImage getImage(index){
    String currentState = itemArray[index];
    switch(currentState) {
      case 'lucky':
        return lucky;
        break;
      case 'unlucky':
        return unlucky;
        break;
      default:
        return circle;
    }
  }

  playGame(int index){
    if(luckyNumber == index){
      setState(() {
        itemArray[index] = 'lucky';
      });
    } else {
      setState(() {
        itemArray[index] = 'unlucky';
      });
    }
  }

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, 'unlucky');
      itemArray[luckyNumber] = 'lucky';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch And Win'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: (){
                    playGame(i);
                  },
                  child: Image(
                    image: getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: showAll,
                  child: Text('Show All'),
                ),
                RaisedButton(
                  onPressed: resetGame  ,
                  child: Text('Reset'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}