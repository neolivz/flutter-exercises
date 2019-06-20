import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  @override
  void initState() {
    super.initState();
    resetGame();  
  }

  void playGame(int index){
    setState(() {  
      if(gameState[index] == 'empty') {
        if(isCross) {
          gameState[index] = 'cross';
        } else {
          gameState[index] = 'circle';
        }
        checkWin();
        isCross = !isCross;
      }
    });
  }

  void resetGame(){
    setState(() {
      gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      message = '9 moves left';
      isCross = true;
    });
  }

  AssetImage getImage(String value){
    switch(value){
      case('empty'):
        return edit;
        break;
      case('cross'):
        return cross;
        break;
      case('circle'):
        return circle;
    }
    return edit;
  }

  void checkWin() {
    if((gameState[0] != 'empty') && (
        (gameState[1] == gameState[0] && gameState[2] == gameState[0])
        || (gameState[3] == gameState[0] && gameState[6] == gameState[0])
        || (gameState[5] == gameState[0] && gameState[8] == gameState[0])
      )) {
        setState(() {
          message =   '${gameState[0]} wins';
        });
    } else if((gameState[1] != 'empty') && (gameState[4] == gameState[1] && gameState[7] == gameState[1])){
        setState(() {
          message =   '${gameState[1]} wins';
        });
    } else if((gameState[2] != 'empty') && (
        (gameState[2] == gameState[4] && gameState[6] == gameState[2])
        || (gameState[2] == gameState[5] && gameState[2] == gameState[8])
      )){
        setState(() {
          message =   '${gameState[2]} wins';
        });
    } else if((gameState[3] != 'empty') && (gameState[3] == gameState[4] && gameState[3] == gameState[5])) {
        setState(() {
          message =   '${gameState[3]} wins';
        });
    } else if((gameState[6] != 'empty') && (gameState[6] == gameState[7] && gameState[6] == gameState[8])) {
        setState(() {
          message =   '${gameState[6]} wins';
        });
    } else if(!gameState.contains('empty')){
      setState(() {
        message = 'Draw';
      });
    }else {
      setState(() {
        message = '${gameState.where((state) => (state == 'empty')).length} moves left';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  itemCount: gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 100,
                    height: 100,
                    child: MaterialButton(
                      onPressed: () => playGame(i),
                      child: Image(
                        image: getImage(gameState[i]),
                      ),
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
              Container(  
                padding: EdgeInsets.all(10),
                child: Text(message,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.purpleAccent,
                minWidth: 300,
                height: 50,
                onPressed: resetGame,
                child: Text('Reset Game', style: TextStyle(color: Colors.white),),
              ),
              Container(child: Text('tic tac toe'),padding: EdgeInsets.fromLTRB(0, 0, 0, 20),)
            ],
          ),
        ),
      ),
    );
  }
}