import 'package:adv/models/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:adv/data/questions.dart';
import 'package:adv/models/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers,});

  final List<String> chosenAnswers;

  List<Map <String, Object>> getSummaryData () {
  final List<Map <String, Object>> summary = [];

  //for body instruction is created
  for (var i = 0; i < chosenAnswers.length; i++){
   //loop
      summary.add(
        {
          'question-index': i,
          'question':questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answers' : chosenAnswers[i]
        },
      );
    }
  return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X questions out of Y'),
            const  SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: getSummaryData()),
            const  SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
