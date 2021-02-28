import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //move this list from build method because this list will only be used in the method not the entired class. (scoping)
  final _questions = const [
    //_questions because it is the private property that available in MyAppState class
    {
      //'key': 'value'
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Pink', 'score': 5},
        {'text': 'White', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 23},
        {'text': 'Cat', 'score': 30},
        {'text': 'Lion', 'score': 50},
        {'text': 'Hippo', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favorite subject?',
      'answers': [
        {'text': 'Math', 'score': 20},
        {'text': 'Science', 'score': 30},
        {'text': 'Economics', 'score': 40},
        {'text': 'Spanish', 'score': 50},
      ]
    },
  ];
  var _questionIndex = 0; //overall class
  var _totalScore = 0; //overall class

  void _resetQuiz() {
    setState(() {
      //will re-trigger build() method of MyAppState class
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score; // shortcut for _totalScore = _totalScore + score

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    // if statement
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more question!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),

        //Ternary Expression  condition ? ture : false
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
