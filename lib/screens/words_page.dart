import 'package:chinese_learning_app/dummy/dummy_data.dart';
import 'package:chinese_learning_app/global_variables/global_colors.dart';
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
      appBar: AppBar(
        title: const Text('Level 1'),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('    Progress'),
                  Stack(
                    children: [
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: GlobalColors.primaryLight,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        height: 30,
                        width: (MediaQuery.of(context).size.width - 32) *
                            (total / DummyData.cardData.length),
                        decoration: BoxDecoration(
                            color: GlobalColors.primaryLight,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              '$total',
                              style: TextStyle(
                                  color: total / DummyData.cardData.length >=
                                          (1 / 12)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            Text(
                              '/${DummyData.cardData.length}  🌟',
                              style: const TextStyle(
                                  color: GlobalColors.fontLight),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: DummyData.cardData.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.6),
                      itemBuilder: (context, index) {
                        return index == DummyData.cardData.length
                            ? const SizedBox()
                            : Stack(
                                alignment: Alignment.center,
                                children: [
                                  Opacity(
                                    opacity: total >= index ? 1 : 0.5,
                                    child: GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg:
                                                'Please read all the previous words to get the next word.');
                                      },
                                      child: CustomFlipCard(
                                        word: DummyData.cardData[index]['word']
                                            .toString(),
                                        chinese: DummyData.cardData[index]
                                                ['chinese']
                                            .toString(),
                                        soundAsset: DummyData.cardData[index]
                                                ['soundAsset']
                                            .toString(),
                                        meaning: DummyData.cardData[index]
                                                ['meaning']
                                            .toString(),
                                        image: DummyData.cardData[index]
                                                ['image']
                                            .toString(),
                                        color: DummyData.cardData[index]
                                            ['color'] as Color,
                                        index: index,
                                      ),
                                    ),
                                  ),
                                  total < index
                                      ? const Icon(Icons.lock)
                                      : Container(),
                                ],
                              );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
