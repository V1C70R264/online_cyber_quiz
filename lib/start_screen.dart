import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
 const StartScreen(this.StartQuiz, {super.key});
  final void Function() StartQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        // Opacity(
        //   opacity: 0.5,
        //   child: Image.asset('assets/images/quiz-logo.png', width: 300,)),
        const SizedBox(
          height: 80,
        ),
        const Text('Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: StartQuiz,
          icon: Icon(Icons.arrow_right_alt),
          label: Text('Start Quiz'),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
        )
      ],
    ));
  }
}
