import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PhrasesScreen extends StatefulWidget {
  static const id = '/phrases';
  const PhrasesScreen({super.key});

  @override
  State<PhrasesScreen> createState() => PhrasesScreenState();
}

class PhrasesScreenState extends State<PhrasesScreen> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/phrases/classroom.mp4');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phrases'),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: Material(
        child: Center(
          child: FutureBuilder<bool>(
            future: started(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data ?? false) {
                return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                );
              } else {
                return const Text('waiting for video to load');
              }
            },
          ),
        ),
      ),
    );
  }
}
