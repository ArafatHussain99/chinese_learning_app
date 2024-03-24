import 'package:flutter/material.dart';

class RankScreen extends StatefulWidget {
  static const id = '/rankscreen';
  const RankScreen({super.key});

  @override
  State<RankScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<RankScreen> {
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
                  BoxShadow(
                    offset: Offset(1, 1),
                  ),
                ],
                color: Colors.grey,
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
                  BoxShadow(
                    offset: Offset(1, 1),
                  ),
                ],
                color: Colors.grey,
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
                  BoxShadow(
                    offset: Offset(1, 1),
                  ),
                ],
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'You',
                        style: TextStyle(color: Colors.yellow, fontSize: 20),
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
          )
        ]),
      )),
    );
  }
}
