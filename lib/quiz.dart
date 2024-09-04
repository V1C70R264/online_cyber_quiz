import 'package:flutter/material.dart';
import 'package:online_quiz_app/data/questions.dart';
import 'package:online_quiz_app/questions_screen.dart';
import 'package:online_quiz_app/results_screen.dart';
import 'package:online_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //creating a list of selected answers
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

//creation of method that stores  selected answers
  void saveSelectedAnswers(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {

        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }


  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        getAnswersSaved: saveSelectedAnswers,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    if (activeScreen == 'restart-screen') {
      screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
  }
}
