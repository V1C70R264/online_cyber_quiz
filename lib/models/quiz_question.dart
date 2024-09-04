class QuizQuestion {
  QuizQuestion({required this.questionText, required this.answers});
  String questionText;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
