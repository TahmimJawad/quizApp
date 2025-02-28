import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswer, required this.restartQuiz});

  final void Function() restartQuiz;

  final List<String> choosenAnswer;
  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answer[0],
        'my_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectAnnswer =
        SummaryData.where((data) => data['correct_answer'] == data['my_answer'])
             .length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You answerd $numCorrectAnnswer out of $numTotalQuestion question correctly! ',
            style: GoogleFonts.lato(
              fontSize: 22,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData: SummaryData),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(Icons.refresh),
            label: const Text(
              'Restart Quiz',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
