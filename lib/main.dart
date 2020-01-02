import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  MaterialColor backgroundColor = Colors.red;
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: backgroundColor,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

int getRandomNumber(int limit) {
  return Random().nextInt(limit) + 1;
}

Image getImageAsset(int number) {
  return Image.asset('images/dice$number.png');
}

class _DicePageState extends State<DicePage> {
  int _leftDiceNumber = getRandomNumber(6);
  int _rightDiceNumber = getRandomNumber(6);

  void changeDiceFace() {
    setState(() {
      _rightDiceNumber = getRandomNumber(6);
      _leftDiceNumber = getRandomNumber(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
// () {} anonymous function
              onPressed: () {
                changeDiceFace();
              },
              child: getImageAsset(_leftDiceNumber),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: getImageAsset(_rightDiceNumber),
            ),
          ),
        ],
      ),
    );
  }
}
