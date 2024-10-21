// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

class UploadAudioScreen extends StatefulWidget {
  const UploadAudioScreen({
    super.key,
  });

  @override
  State<UploadAudioScreen> createState() => _UploadAudioScreenState();
}

class _UploadAudioScreenState extends State<UploadAudioScreen> {
  List<File> pickedAudio = [];

  Future<void> pick() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
      );
      if (result != null) {
        for (PlatformFile audio in result.files) {
          setState(() {
            pickedAudio.add(
              File(audio.path!),
            );
          });
        }
      } else {
        for (PlatformFile audio in result!.files) {
          print(audio.path);
          setState(() {
            pickedAudio.add(
              File(audio.path!),
            );
          });
        }
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> upload({
    required List<String> pathes,
  }) async {
    FormData formData = FormData();
    for (String filePath in pathes) {
      formData.files.add(
        MapEntry(
          'audios[]',
          await MultipartFile.fromFile(
            filePath,
          ),
        ),
      );
    }
    Dio().post(
      'https://file.io/?expires=1w',
      data: formData,
      onSendProgress: (count, total) {
        print('onSendProgress');
      },
      options: Options(
        contentType: 'multipart/form-data',
      ),
    ).then((value) {
      print(value.data);
    }).catchError((error) {
      if (error is DioException) {
        print(error.response);
      }
      print(error);
    });
  }

  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  FlutterSoundPlayer player = FlutterSoundPlayer();

  String pathToFile = '';

  Future<void> startRecord() async {
    try {
      await recorder.openRecorder();

      Directory? directory = await getExternalStorageDirectory();

      pathToFile = '${directory!.path}/my_audio.aac';
      await recorder.startRecorder(
        toFile: pathToFile,
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> stopRecord() async {
    try {
      await recorder.stopRecorder();
      await recorder.closeRecorder();
      setState(() {
        pathToFile = pathToFile;
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> playRecord() async {
    try {
      await player.openPlayer();
      await player.startPlayer(
        fromURI: pathToFile,
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> stopPlayRecord() async {
    try {
      await player.closePlayer();
      await player.stopPlayer();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Audio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    pick();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Pick Audio',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: () {
                    upload(
                      pathes: pickedAudio.map((e) => e.path).toList(),
                    );
                  },
                  color: Colors.red,
                  child: const Text(
                    'Upload  Picked Audio',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Text(pickedAudio.map((e) => e.path).toList().toString()),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    startRecord();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Start Record',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: () {
                    stopRecord();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Stop Record',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Text(pathToFile),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    playRecord();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Play Record',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: () {
                    stopPlayRecord();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Stop Play Record',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                upload(
                  pathes: [
                    pathToFile,
                  ],
                );
              },
              color: Colors.red,
              child: const Text(
                'Upload  Record Audio',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
