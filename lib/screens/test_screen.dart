// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  AudioPlayer player = AudioPlayer();

  Future<void> playAudio() async {
    try {
      await player.setAudioSource(
        AudioSource.asset('assets/audio_file.mp3'),
      );
      player.play();
    } catch (error) {
      print('Error in play ===>>$error');
    }
  }

  Future<void> stopAudio() async {
    try {
      await player.stop();
    } catch (error) {
      print('Error in Stop ===>>$error');
    }
  }

  Future<void> resumeAudio() async {
    try {
      await player.play();
    } catch (error) {
      print('Error in resume ===>>$error');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Audio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<Duration>(
            stream: player.positionStream,
            builder: (
              BuildContext context,
              AsyncSnapshot<Duration?> snapshot,
            ) {
              final Duration duration = snapshot.data ?? Duration.zero;
              return Column(
                children: [
                  Text(
                    '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  ),
                  Slider(
                    value: duration.inMilliseconds.toDouble(),
                    max: player.duration?.inMilliseconds.toDouble() ?? 0,
                    onChanged: (double value) {
                      player.seek(
                        Duration(
                          milliseconds: value.toInt(),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  playAudio();
                },
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  stopAudio();
                },
                icon: const Icon(
                  Icons.stop,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  resumeAudio();
                },
                icon: const Icon(
                  Icons.multitrack_audio_sharp,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
