import 'package:flutter/material.dart';

void main(){
  var app = MaterialApp(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Plain Text'),
            Text('Plain Text 2')
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
  runApp(app);
}