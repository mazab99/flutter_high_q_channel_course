// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:just_audio/just_audio.dart';

class PlaySoundScreen extends StatefulWidget {
  const PlaySoundScreen({
    super.key,
  });

  @override
  State<PlaySoundScreen> createState() => _PlaySoundScreenState();
}

class _PlaySoundScreenState extends State<PlaySoundScreen> {
  AudioPlayer player = AudioPlayer();

  Future<void> playAudio() async {
    try {
      await player.setAudioSource(
        AudioSource.asset('assets/audio_file.mp3'),
      );
      await player.play();
    } catch (error) {
      print('Error in play $error');
    }
  }

  Future<void> stopAudio() async {
    try {
      await player.stop();
    } catch (error) {
      print('Error in stop $error');
    }
  }

  Future<void> resumeAudio() async {
    try {
      await player.play();
    } catch (error) {
      print('Error in resume $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Play Sound',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexColor('1B1E2D'),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    playAudio();
                  },
                  icon: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    stopAudio();
                  },
                  icon: const Icon(
                    Icons.stop,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    resumeAudio();
                  },
                  icon: const Icon(
                    Icons.multitrack_audio_sharp,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            StreamBuilder<Duration>(
              stream: player.positionStream,
              builder: (
                context,
                snapshot,
              ) {
                final Duration position = snapshot.data ?? Duration.zero;
                return Column(
                  children: [
                    Text(
                      '${player.duration!.inMinutes}:${player.duration!.inSeconds % 60}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Slider(
                      value: position.inMilliseconds.toDouble(),
                      max: player.duration?.inMilliseconds.toDouble() ?? 0,
                      onChanged: (double value) {
                        player.seek(
                          Duration(
                            milliseconds: value.toInt(),
                          ),
                        );
                      },
                      activeColor: Colors.red,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
