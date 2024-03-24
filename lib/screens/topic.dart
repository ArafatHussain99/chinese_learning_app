import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/phrases.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:chinese_learning_app/screens/words_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy/dummy_data.dart';
import '../provider/provider.dart';

class TopicDetailPage extends ConsumerStatefulWidget {
  static const String id = 'tpc_detail_page';
  const TopicDetailPage({super.key});

  @override
  TopicDetailPageState createState() => TopicDetailPageState();
}

class TopicDetailPageState extends ConsumerState {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveScore() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('score', ref.read(score));
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(score);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WordsScreen.id);
                  },
                  child: const StudyCard(
                    color: GlobalColors.secondary,
                    text: 'Words',
                    textColor: Colors.white,
                  )),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (ref.read(score) < DummyData.cardData.length) {
                          Fluttertoast.showToast(
                              msg: 'Please complete level 1 first');
                        } else {
                          ref.read(score.notifier).state = ref.read(score) + 1;
                          saveScore();
                          Navigator.pushNamed(context, PhrasesScreen.id);
                        }
                      },
                      child: StudyCard(
                        color: ref.read(score) >= DummyData.cardData.length
                            ? const Color.fromARGB(255, 109, 91, 201)
                            : const Color.fromARGB(255, 109, 91, 201)
                                .withOpacity(0.5),
                        text: 'Phrases',
                        textColor: ref.read(score) >= DummyData.cardData.length
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                  ref.read(score) >= DummyData.cardData.length
                      ? Container()
                      : const Icon(Icons.lock),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (ref.read(score) <= DummyData.cardData.length) {
                          Fluttertoast.showToast(
                              msg: 'Please complete level 1 and 2 first');
                        } else {
                          Navigator.pushNamed(context, QuizScreen.id);
                        }
                      },
                      child: StudyCard(
                        color: ref.read(score) > DummyData.cardData.length
                            ? const Color.fromARGB(255, 210, 86, 136)
                            : const Color.fromARGB(255, 210, 86, 136)
                                .withOpacity(0.5),
                        text: 'Test',
                        textColor: ref.read(score) > DummyData.cardData.length
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                  ref.read(score) > DummyData.cardData.length
                      ? Container()
                      : const Icon(Icons.lock),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
