import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RankScreen extends ConsumerStatefulWidget {
  static const id = '/rankscreen';
  const RankScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rank'),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: Offset(1, 1), color: Colors.grey),
                ],
                color: GlobalColors.purpleLight,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Arafat',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '100',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: Offset(1, 1), color: Colors.grey),
                ],
                color: GlobalColors.purpleLight,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dewan',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '80',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(offset: Offset(1, 1), color: Colors.grey),
              ],
              color: GlobalColors.creme,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'You',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        '${ref.read(score)}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
