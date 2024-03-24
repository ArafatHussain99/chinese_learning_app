import 'package:chinese_learning_app/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const id = '/quiz';
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: QuizCard(),
    );
  }
}
