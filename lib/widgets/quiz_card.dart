import 'package:chinese_learning_app/dummy/dummy_data.dart';
import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/screens/home.dart';
import 'package:chinese_learning_app/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizCard extends ConsumerStatefulWidget {
  const QuizCard({super.key, required this.quizData});

  final List<Map<String, String>> quizData;

  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends ConsumerState<QuizCard> {
  int quiznNumber = 0;
  bool option1Selected = false;
  bool option2Selected = false;
  bool option3Selected = false;
  String selectedOption = '';
  String selectedOptionBackup = '';
  String buttonText = 'Submit';
  int score = 0;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveScore(int score) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('score', score);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz ${quiznNumber + 1}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please arrange the following words in order.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          option1Selected = option1Selected ? false : true;
                          option1Selected
                              ? selectedOption = '${selectedOption}A'
                              : {
                                  selectedOptionBackup = '',
                                  for (int i = 0;
                                      i < selectedOption.length;
                                      i++)
                                    {
                                      if (selectedOption[i] != 'A')
                                        {
                                          selectedOptionBackup +=
                                              selectedOption[i]
                                        }
                                    },
                                  selectedOption = selectedOptionBackup
                                };
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: option1Selected
                                ? GlobalColors.blue
                                : Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                            'A. ${widget.quizData[quiznNumber]['option1']}'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          option2Selected = option2Selected ? false : true;
                          option2Selected
                              ? selectedOption = '${selectedOption}B'
                              : {
                                  selectedOptionBackup = '',
                                  for (int i = 0;
                                      i < selectedOption.length;
                                      i++)
                                    {
                                      if (selectedOption[i] != 'B')
                                        {
                                          selectedOptionBackup +=
                                              selectedOption[i]
                                        }
                                    },
                                  selectedOption = selectedOptionBackup
                                };
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: option2Selected
                                ? GlobalColors.creme
                                : Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                            'B. ${widget.quizData[quiznNumber]['option2']}'),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    option3Selected = option3Selected ? false : true;
                    option3Selected
                        ? selectedOption = '${selectedOption}C'
                        : {
                            selectedOptionBackup = '',
                            for (int i = 0; i < selectedOption.length; i++)
                              {
                                if (selectedOption[i] != 'C')
                                  {selectedOptionBackup += selectedOption[i]}
                              },
                            selectedOption = selectedOptionBackup
                          };
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: option3Selected
                          ? GlobalColors.purpleLight
                          : Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('C. ${widget.quizData[quiznNumber]['option3']}'),
                ),
              ),
              selectedOption == ''
                  ? Container()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Your selected order: $selectedOption'),
                        buttonText == 'Submit'
                            ? Container()
                            : selectedOption ==
                                    widget.quizData[quiznNumber]['answer']
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        'Correct!',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Text(
                                        'Meaning: ${widget.quizData[quiznNumber]['meaning']}',
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        'Wrong!',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        'Right Answer: ${widget.quizData[quiznNumber]['answer']}',
                                      ),
                                      Text(
                                        'Meaning: ${widget.quizData[quiznNumber]['meaning']}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                      ],
                    ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (quiznNumber >= 4) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Score'),
                    content: score < 4
                        ? Text(
                            'Your score is $score. You have to watch the video again to re-take the quiz')
                        : Text('Your score is $score'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.id);
                          if (score < 4) {
                            saveScore(DummyData.cardData.length);
                          }
                        },
                        child: const Text('Home'),
                      ),
                      score > 3
                          ? TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, QuizScreen.id, (route) => false);
                              },
                              child: const Text('Re-take quiz'),
                            )
                          : Container(),
                    ],
                  ),
                );
              } else {
                if (buttonText == 'Next') {
                  setState(() {
                    quiznNumber = quiznNumber + 1;
                    selectedOption = '';
                    selectedOptionBackup = '';
                    option1Selected = false;
                    option2Selected = false;
                    option3Selected = false;
                    buttonText = 'Submit';
                  });
                } else {
                  if (selectedOption.length != 3) {
                    Fluttertoast.showToast(msg: 'Please select all options');
                  } else {
                    setState(() {
                      buttonText = 'Next';
                      if (selectedOption ==
                          widget.quizData[quiznNumber]['answer']) {
                        score = score + 1;
                        print(score);
                      }
                    });
                  }
                }
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: selectedOption.length == 3
                      ? GlobalColors.primary
                      : GlobalColors.primary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
