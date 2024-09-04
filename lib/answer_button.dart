import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final void Function() onTap;
  final String answerText;
  @override
  Widget build(context) {
    return ElevatedButton(onPressed: onTap, child: Text(answerText));
  }
}
