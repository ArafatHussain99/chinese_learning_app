import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:chinese_learning_app/screens/words_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomePage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    case WordsScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WordsScreen(),
      );
    case QuizScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const QuizScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist..'),
          ),
        ),
      );
  }
}
