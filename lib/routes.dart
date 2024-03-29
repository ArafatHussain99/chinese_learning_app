import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/phrases.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:chinese_learning_app/screens/rank.dart';
import 'package:chinese_learning_app/screens/topic.dart';
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
    case RankScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RankScreen(),
      );
    case PhrasesScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PhrasesScreen(),
      );
    case TopicDetailPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TopicDetailPage(),
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
