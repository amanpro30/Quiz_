import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final question = const [
    {
      'questionText': 'What "s your favourite color?',
      'answers': ['Black', 'Green', 'Red', 'White'],
    },
    {
      'questionText': 'What "s your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Lion', 'Tiger'],
    },
    {
      'questionText': 'Who "s your favourite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];
  void _answerQuestion() {
    if (_questionIndex < question.length) {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < question.length
            ? Column(
                children: <Widget>[
                  Question(question[_questionIndex]['questionText']),
                  ...(question[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it !'),
              ),
      ),
    );
  }
}
