import 'package:flutter/material.dart';

import 'questionsDatabase.dart';
import 'quizz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State {
  int _questionIndex = 0;
  int _score = 0;

  bool _quizzEnd = false;

  void selectAnswer(answer) {
    if (_questionIndex + 1 >= questionsDatabase.length) {
      setState(() {
        _quizzEnd = true;
        _score += answer['score'];
      });
    } else {
      setState(() {
        _questionIndex++;
        _score += answer['score'];
      });
    }
  }

  void restartQuizz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _quizzEnd = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz de personnalité',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz de personnalité'),
        ),
        body: !_quizzEnd
            ? Quizz(
                question: questionsDatabase[_questionIndex],
                selectAnswer: selectAnswer,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Votre score : ' + _score.toString(),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      right: 25,
                      left: 25,
                    ),
                    child: ElevatedButton(
                      onPressed: restartQuizz,
                      child: Text('Recommencer'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
