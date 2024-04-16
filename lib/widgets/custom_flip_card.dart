import 'package:chinese_learning_app/provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomFlipCard extends ConsumerStatefulWidget {
  const CustomFlipCard(
      {super.key,
      required this.soundAsset,
      required this.meaning,
      required this.word,
      required this.chinese,
      required this.image,
      required this.color,
      required this.index,
      required this.data,
      required this.flipOnTouch});
  final String soundAsset;
  final String meaning;
  final String word;
  final String chinese;
  final String image;
  final Color color;
  final int index;
  final List<Map<String, Object>> data;
  final bool flipOnTouch;

  @override
  CustomFlipCardState createState() => CustomFlipCardState();
}

class CustomFlipCardState extends ConsumerState<CustomFlipCard> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveScore() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('score', ref.read(score));
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();

    return FlipCard(
      onFlip: () {
        player.stop();
        player = AudioPlayer()..setAsset(widget.soundAsset);
        player.play();
      },
      onFlipDone: (isFront) {
        if (widget.data[widget.index]['read'] == false) {
          widget.data[widget.index]['read'] = true;
          ref.read(score.notifier).state = ref.read(score) + 1;
          saveScore();
        }
      },
      flipOnTouch: widget.flipOnTouch,
      fill: Fill.fillBack,
      side: CardSide.FRONT,
      back: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.meaning,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            widget.image != ''
                ? Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 140,
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      front: Container(
        width: 170,
        height: 100,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.chinese,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text(widget.word,
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
