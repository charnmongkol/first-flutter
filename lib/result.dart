import 'package:flutter/material.dart';

//To show result score

class Result extends StatelessWidget {
  //Add final property
  final int resultScore;
  final Function resetHandler;

  //Add constructor and personal argument
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 60) {
      resultText = 'You are awesome';
    } else if (resultScore <= 70) {
      resultText = 'You are pretty savage!';
    } else if (resultScore <= 80) {
      resultText = 'You are Dynamite....BTS!';
    } else {
      resultText = 'You are Dolphin... ta ta ta ta';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        // FlatButton -> normal button withput bg color
        FlatButton(onPressed: resetHandler, child: Text('Restart Quiz'))
      ], //children:
    ));
  }
}
