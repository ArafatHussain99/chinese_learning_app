import 'package:chinese_learning_app/dummy/dummy_data_friends.dart';
import 'package:chinese_learning_app/dummy/dummy_data_hospital.dart';
import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/screens/friends/friends_phrases.dart';
import 'package:chinese_learning_app/screens/friends/friends_words_page.dart';
import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../dummy/dummy_data.dart';
import '../../provider/provider.dart';

class FriendsTopicDetailPage extends ConsumerStatefulWidget {
  static const String id = 'Friendstpc_detail_page';
  const FriendsTopicDetailPage({super.key});

  @override
  FriendsTopicDetailPageState createState() => FriendsTopicDetailPageState();
}

class FriendsTopicDetailPageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    ref.watch(score);
    ref.watch(friendsDone);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
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
                    Navigator.pushNamed(context, FriendsWordsScreen.id);
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
                        if (ref.read(score) <
                            (DummyData.cardData.length +
                                DummyDataFriends.cardData.length +
                                DummyDataHospital.cardData.length)) {
                          Fluttertoast.showToast(
                              msg: 'Please complete level 1 first');
                        } else {
                          ref.read(friendsDone.notifier).state = true;
                          Navigator.pushNamed(context, FriendsPhrasesScreen.id);
                        }
                      },
                      child: StudyCard(
                        color: ref.read(score) >=
                                (DummyData.cardData.length +
                                    DummyDataFriends.cardData.length +
                                    DummyDataHospital.cardData.length)
                            ? const Color.fromARGB(255, 109, 91, 201)
                            : const Color.fromARGB(255, 109, 91, 201)
                                .withOpacity(0.5),
                        text: 'Phrases',
                        textColor: ref.read(score) >=
                                (DummyData.cardData.length +
                                    DummyDataFriends.cardData.length +
                                    DummyDataHospital.cardData.length)
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                  ref.read(score) >=
                          (DummyData.cardData.length +
                              DummyDataFriends.cardData.length +
                              DummyDataHospital.cardData.length)
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
                        if (!ref.read(friendsDone)) {
                          Fluttertoast.showToast(
                              msg: 'Please complete level 1 and 2 first');
                        } else {
                          Navigator.pushNamed(context, QuizScreen.id);
                        }
                      },
                      child: StudyCard(
                        color: ref.read(friendsDone)
                            ? const Color.fromARGB(255, 210, 86, 136)
                            : const Color.fromARGB(255, 210, 86, 136)
                                .withOpacity(0.5),
                        text: 'Test',
                        textColor: ref.read(friendsDone)
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                  ref.read(friendsDone) ? Container() : const Icon(Icons.lock),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
