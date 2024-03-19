import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/provider/provider.dart';
import 'package:chinese_learning_app/screens/words_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String id = 'home_page';
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    int total = ref.watch(score);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: GlobalColors.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: 'You have completed 0 challenges so far.',
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '🏆 0',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '/3',
                                    style: TextStyle(
                                        color: GlobalColors.fontLight),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg:
                                      'You have 0 stars. Learn more words to earn more stars.');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  '🌟 $total',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Hello 👋, welcome to learing chinese easily.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              '28',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '/217  🧔‍♂️',
                              style: TextStyle(color: GlobalColors.fontLight),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                              msg:
                                  'You have to gather atleast 150 stars first to start challenges.',
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: GlobalColors.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Challenges',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(width: 4),
                                Image.asset(
                                  'assets/lottie/arrow.gif',
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My studies',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WordsScreen.id);
                      },
                      child: const StudyCard(
                        color: GlobalColors.secondary,
                        text: 'Level 1',
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
                            Fluttertoast.showToast(
                                msg: 'Please complete level 1 first');
                          },
                          child: StudyCard(
                            color: Color.fromARGB(255, 109, 91, 201)
                                .withOpacity(0.5),
                            text: 'Level 2',
                            textColor: Colors.white.withOpacity(0.5),
                          )),
                      const Icon(Icons.lock),
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
                            Fluttertoast.showToast(
                                msg: 'Please complete level 1 first');
                          },
                          child: StudyCard(
                            color: Color.fromARGB(255, 210, 86, 136)
                                .withOpacity(0.5),
                            text: 'Level 3',
                            textColor: Colors.white.withOpacity(0.5),
                          )),
                      const Icon(Icons.lock),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudyCard extends StatefulWidget {
  const StudyCard(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor});
  final Color color;
  final String text;
  final Color textColor;

  @override
  State<StudyCard> createState() => _StudyCardState();
}

class _StudyCardState extends State<StudyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.w800,
              fontSize: 20),
        ),
      ),
    );
  }
}
