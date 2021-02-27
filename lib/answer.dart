import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final dynamic answer;
  final Function selectAnswer;

  Answer({
    @required this.answer,
    @required this.selectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: ElevatedButton(
          onPressed: () => selectAnswer(answer),
          child: Text(
            answer['answer'],
          ),
        ),
      ),
    );
  }
}
