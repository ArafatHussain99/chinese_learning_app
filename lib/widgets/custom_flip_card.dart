import 'package:chinese_learning_app/provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class CustomFlipCard extends ConsumerStatefulWidget {
  const CustomFlipCard(
      {super.key,
      required this.soundAsset,
      required this.meaning,
      required this.word,
      required this.chinese,
      required this.image});
  final String soundAsset;
  final String meaning;
  final String word;
  final String chinese;
  final String image;

  @override
  CustomFlipCardState createState() => CustomFlipCardState();
}

class CustomFlipCardState extends ConsumerState<CustomFlipCard> {
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();

    return FlipCard(
      onFlip: () {
        player.stop();
        player = AudioPlayer()..setAsset(widget.soundAsset);
        player.play();
        ref.read(score.notifier).state = ref.read(score) + 1;
      },
      fill: Fill.fillBack,
      side: CardSide.FRONT,
      back: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF133771),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF133771).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(widget.meaning,
                    style: const TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
            Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.asset(widget.image, fit: BoxFit.fitHeight),
                )),
          ],
        ),
      ),
      front: Container(
        width: 170,
        decoration: BoxDecoration(
          color: const Color(0xFF133771),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF133771).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: Column(
          children: [
            Text(widget.chinese,
                style: const TextStyle(fontSize: 30, color: Colors.white)),
            Text(widget.word,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
