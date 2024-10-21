// ignore_for_file: avoid_print
import 'dart:core';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  ImagePicker videoPicker = ImagePicker();
  List<XFile> pickedVideos = [];
  List<VideoPlayerController> videoPlayerControllers = [];

  Future<void> pickVideo() async {
    try {
      XFile? video = await videoPicker.pickVideo(
        source: ImageSource.gallery,
      );
      if (video != null) {
        setState(() {
          pickedVideos.add(video);
          videoPlayerControllers.add(
            VideoPlayerController.file(
              File(
                video.path,
              ),
            ),
          );
        });
        await Future.wait(
          videoPlayerControllers.map(
            (VideoPlayerController controller) {
              return init(
                controller,
              );
            },
          ),
        );
        // videoPlayerControllers.last.play();
        // videoPlayerControllers.last.setLooping(false);
      } else {
        setState(() {
          pickedVideos = [video!];
          videoPlayerControllers.add(
            VideoPlayerController.file(
              File(
                video.path,
              ),
            ),
          );
        });
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> init(VideoPlayerController controller) async {
    await controller.initialize();
    controller.addListener(() {
      if (controller.value.hasError) {
        print(controller.value.errorDescription);
      }
    });
    setState(() {});
  }

  Future<void> remove(int index) async {
    setState(() {
      pickedVideos.removeAt(index);
      videoPlayerControllers.removeAt(index);
    });
  }

  Future<void> upload({required List<String> pathes}) async {
    FormData formData = FormData();
    for (var path in pathes) {
      formData.files.add(
        MapEntry(
          'videos[]',
          await MultipartFile.fromFile(
            path,
          ),
        ),
      );
    }
    Dio()
        .post(
      'https://file.io/?expires=1w',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    )
        .then((value) {
      print(value);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void dispose() {
    for (var controller in videoPlayerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Video"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: pickVideo,
                  child: const Text('Pick'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    upload(
                      pathes: pickedVideos.map((e) => e.path).toList(),
                    );
                  },
                  child: const Text('Upload'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < videoPlayerControllers.length; i++)
              if (videoPlayerControllers[i].value.isInitialized)
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: AspectRatio(
                            aspectRatio:
                                videoPlayerControllers[i].value.aspectRatio,
                            child: VideoPlayer(
                              videoPlayerControllers[i],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            remove(i);
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
