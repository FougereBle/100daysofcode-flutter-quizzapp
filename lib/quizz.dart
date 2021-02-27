import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quizz extends StatelessWidget {
  final dynamic question;
  final Function selectAnswer;

  Quizz({
    @required this.question,
    @required this.selectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Question(question: question),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...question['answers'].map(
                (a) {
                  return Answer(
                    answer: a,
                    selectAnswer: selectAnswer,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
