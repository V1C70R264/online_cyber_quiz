import 'package:flutter/material.dart';
import 'package:online_quiz_app/data/questions.dart';
import 'package:online_quiz_app/start_screen.dart';
import 'package:online_quiz_app/summary_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});
  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }
  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((answer) {
      return answer['correct_answer'] == answer['user_answer'];
    }).length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly',
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          SummaryData(summaryData: summaryData),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              )
        ],
      ),
    );
  }
}
