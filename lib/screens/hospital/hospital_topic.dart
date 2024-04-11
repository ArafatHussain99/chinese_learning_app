import 'package:chinese_learning_app/dummy/dummy_data_hospital.dart';
import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/hospital/hospital_phrases.dart';
import 'package:chinese_learning_app/screens/hospital/hospital_words_page.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../dummy/dummy_data.dart';
import '../../provider/provider.dart';

class HospitalTopicDetailPage extends ConsumerStatefulWidget {
  static const String id = 'Hospitaltpc_detail_page';
  const HospitalTopicDetailPage({super.key});

  @override
  TopicDetailPageState createState() => TopicDetailPageState();
}

class TopicDetailPageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    ref.watch(score);
    ref.watch(classroomDone);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital'),
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
                    Navigator.pushNamed(context, HospitalWordsScreen.id);
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
                                DummyDataHospital.cardData.length)) {
                          Fluttertoast.showToast(
                              msg: 'Please complete level 1 first');
                        } else {
                          ref.read(classroomDone.notifier).state = true;
                          Navigator.pushNamed(
                              context, HospitalPhrasesScreen.id);
                        }
                      },
                      child: StudyCard(
                        color: ref.read(score) >=
                                (DummyData.cardData.length +
                                    DummyDataHospital.cardData.length)
                            ? const Color.fromARGB(255, 109, 91, 201)
                            : const Color.fromARGB(255, 109, 91, 201)
                                .withOpacity(0.5),
                        text: 'Phrases',
                        textColor: ref.read(score) >=
                                (DummyData.cardData.length +
                                    DummyDataHospital.cardData.length)
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                  ref.read(score) >=
                          (DummyData.cardData.length +
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
                        if (!ref.read(classroomDone)) {
                          Fluttertoast.showToast(
                              msg: 'Please complete level 1 and 2 first');
                        } else {
                          Navigator.pushNamed(context, QuizScreen.id);
                        }
                      },
                      child: StudyCard(
                        color: ref.read(classroomDone)
                            ? const Color.fromARGB(255, 210, 86, 136)
                            : const Color.fromARGB(255, 210, 86, 136)
                                .withOpacity(0.5),
                        text: 'Test',
                        textColor: ref.read(classroomDone)
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      )),
                  ref.read(classroomDone)
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
