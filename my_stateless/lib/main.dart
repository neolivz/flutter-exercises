import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Flutter App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.redAccent,
      accentColor: Colors.blueAccent,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Plain Text'),
            Text('Plain Text 2'),
            RaisedButton(
              onPressed: (){},
              splashColor: Colors.orangeAccent,
              child: Text('Signup'),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add_a_photo,
          color: Colors.black,
        ),
      ),
    ),
  );
  }
}

void main(){
  runApp(MyApp());
}