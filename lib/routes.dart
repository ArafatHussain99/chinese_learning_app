import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/classroom/phrases.dart';
import 'package:chinese_learning_app/screens/hospital/hospital_phrases.dart';
import 'package:chinese_learning_app/screens/hospital/hospital_topic.dart';
import 'package:chinese_learning_app/screens/hospital/hospital_words_page.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:chinese_learning_app/screens/rank.dart';
import 'package:chinese_learning_app/screens/classroom/topic.dart';
import 'package:chinese_learning_app/screens/classroom/words_page.dart';
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
    case HospitalPhrasesScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HospitalPhrasesScreen(),
      );
    case HospitalTopicDetailPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HospitalTopicDetailPage(),
      );
    case HospitalWordsScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HospitalWordsScreen(),
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
