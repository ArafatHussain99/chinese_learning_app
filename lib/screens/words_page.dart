import 'package:chinese_learning_app/provider/provider.dart';
import 'package:chinese_learning_app/widgets/custom_flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WordsScreen extends ConsumerStatefulWidget {
  static const String id = 'words_page';
  const WordsScreen({
    super.key,
  });

  @override
  WordsScreenState createState() => WordsScreenState();
}

class WordsScreenState extends ConsumerState<WordsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int total = ref.watch(score);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF133771), Color(0xFF071A2C)],
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Score: $total',
                          style: const TextStyle(
                              fontSize: 35, color: Colors.white),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomFlipCard(
                                word: '(Nǐ hǎo)',
                                chinese: '你好',
                                soundAsset: 'assets/sound_clips/1.mp3',
                                meaning: 'Hello!',
                                image: 'assets/images/hello.jpeg',
                              ),
                              // FlipCard(
                              //   onFlip: () {
                              //     _player.stop();
                              //     _player = AudioPlayer()
                              //       ..setAsset('assets/sound_clips/1.mp3');
                              //     _player.play();
                              //     print('pressed');
                              //   },
                              //   fill: Fill.fillBack,
                              //   side: CardSide.FRONT,
                              //   back: Container(
                              //     decoration: BoxDecoration(
                              //       color: const Color(0xFF133771),
                              //       borderRadius: BorderRadius.circular(20),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: const Color(0xFF133771).withOpacity(0.5),
                              //           spreadRadius: 5,
                              //           blurRadius: 7,
                              //           offset: const Offset(
                              //               1, 1), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         const Expanded(
                              //           child: Center(
                              //             child: Text('Hello!',
                              //                 style: TextStyle(
                              //                     fontSize: 30, color: Colors.white)),
                              //           ),
                              //         ),
                              //         Expanded(
                              //             flex: 2,
                              //             child: ClipRRect(
                              //               borderRadius: const BorderRadius.only(
                              //                   bottomLeft: Radius.circular(20),
                              //                   bottomRight: Radius.circular(20)),
                              //               child: Image.asset('assets/images/hello.jpeg',
                              //                   fit: BoxFit.fitHeight),
                              //             )),
                              //       ],
                              //     ),
                              //   ),
                              //   front: Container(
                              //     width: 170,
                              //     decoration: BoxDecoration(
                              //       color: const Color(0xFF133771),
                              //       borderRadius: BorderRadius.circular(20),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: const Color(0xFF133771).withOpacity(0.5),
                              //           spreadRadius: 5,
                              //           blurRadius: 7,
                              //           offset: const Offset(
                              //               1, 1), // changes position of shadow
                              //         ),
                              //       ],
                              //     ),
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 40, vertical: 80),
                              //     child: const Column(
                              //       children: [
                              //         Text('你好',
                              //             style: TextStyle(
                              //                 fontSize: 30, color: Colors.white)),
                              //         Text('(Nǐ hǎo)',
                              //             style: TextStyle(
                              //                 fontSize: 20, color: Colors.white)),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                width: 16,
                              ),
                              CustomFlipCard(
                                word: '(Xièxiè)',
                                chinese: '谢谢',
                                soundAsset: 'assets/sound_clips/2.mp3',
                                meaning: 'Thank You!',
                                image: 'assets/images/thankyou.jpg',
                              ),
                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         _player = AudioPlayer()
                              //           ..setAsset('assets/sound_clips/2.mp3');
                              //         _player.play();
                              //       },
                              //       child: Container(
                              //         width: 170,
                              //         decoration: BoxDecoration(
                              //           color: const Color(0xFF133771),
                              //           borderRadius: BorderRadius.circular(20),
                              //           boxShadow: [
                              //             BoxShadow(
                              //               color: const Color(0xFF133771).withOpacity(0.5),
                              //               spreadRadius: 5,
                              //               blurRadius: 7,
                              //               offset: const Offset(
                              //                   1, 1), // changes position of shadow
                              //             ),
                              //           ],
                              //         ),
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 40, vertical: 80),
                              //         child: const Column(
                              //           children: [
                              //             Text('谢谢',
                              //                 style: TextStyle(
                              //                     fontSize: 30, color: Colors.white)),
                              //             Text('(Xièxiè)',
                              //                 style: TextStyle(
                              //                     fontSize: 20, color: Colors.white)),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomFlipCard(
                                word: '(Bàoqiàn)',
                                chinese: '抱歉',
                                soundAsset: 'assets/sound_clips/3.mp3',
                                meaning: 'Sorry',
                                image: 'assets/images/sorry.jpeg',
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              CustomFlipCard(
                                word: '(Zàijiàn)',
                                chinese: '再见',
                                soundAsset: 'assets/sound_clips/4.mp3',
                                meaning: 'Goodbye',
                                image: 'assets/images/bye.jpg',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (total < 4) {
                  Fluttertoast.showToast(
                      msg: 'Please listen to all the audios before the test');
                } else {
                  Fluttertoast.showToast(msg: 'You are eligible for the test');
                }
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: total < 4
                    ? const Color(0xffD78B40).withOpacity(0.5)
                    : const Color(0xffD78B40),
                child: Center(
                    child: Text(
                  'Give Test',
                  style: TextStyle(
                      fontSize: 20,
                      color: total < 4
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
