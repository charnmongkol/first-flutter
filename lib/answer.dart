import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //properties
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler,
      this.answerText); //will automatically add value to the properties

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(answerText),
        onPressed: selectHandler, //onPress takes the function without argument
      ),
    );
  }
}
