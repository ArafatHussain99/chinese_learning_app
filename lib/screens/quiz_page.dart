import 'package:chinese_learning_app/dummy/quiz_data.dart';
import 'package:chinese_learning_app/provider/provider.dart';
import 'package:chinese_learning_app/widgets/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerStatefulWidget {
  static const id = '/quiz';
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState {
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
      body: QuizCard(
        quizData: ref.read(topic) == 'classroom'
            ? quizData.classroomQuiz
            : ref.read(topic) == 'hospital'
                ? quizData.hospitalQuiz
                : quizData.friendsQuiz,
      ),
    );
  }
}
