import 'package:chinese_learning_app/dummy/dummy_data.dart';
import 'package:chinese_learning_app/global_variables/global_colors.dart';
import 'package:chinese_learning_app/provider/provider.dart';
import 'package:chinese_learning_app/widgets/custom_flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
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
                        width: 100,
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
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Text(
                              '/10  ❤️',
                              style: TextStyle(color: GlobalColors.fontLight),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: cardData.length + 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.6),
                        itemBuilder: (context, index) {
                          return index == cardData.length
                              ? const SizedBox()
                              : Opacity(
                                  opacity: total >= index ? 1 : 0.5,
                                  child: CustomFlipCard(
                                    word: cardData[index]['word'].toString(),
                                    chinese:
                                        cardData[index]['chinese'].toString(),
                                    soundAsset: cardData[index]['soundAsset']
                                        .toString(),
                                    meaning:
                                        cardData[index]['meaning'].toString(),
                                    image: cardData[index]['image'].toString(),
                                    color: cardData[index]['color'] as Color,
                                  ),
                                );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
