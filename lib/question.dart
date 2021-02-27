import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final dynamic question;

  Question({
    @required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          question['question'],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
