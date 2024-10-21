import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagesScreen extends StatefulWidget {
  const UploadImagesScreen({super.key});

  @override
  State<UploadImagesScreen> createState() => _UploadImagesScreenState();
}

class _UploadImagesScreenState extends State<UploadImagesScreen> {
  ImagePicker imagePicker = ImagePicker();
  List<XFile> pickedImages = [];

  Future<void> pickFromCamera() async {
    try {
      XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (image != null) {
        setState(() {
          pickedImages.add(
            image,
          );
        });
      } else {
        setState(() {
          pickedImages = [image!];
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> removeImage({
    required String imagePath,
  }) async {
    setState(() {
      pickedImages.removeWhere(
        (element) {
          return element.path == imagePath;
        },
      );
    });
  }

  Future<void> pickFromGallery() async {
    try {
      List<XFile> images = await imagePicker.pickMultiImage();
      // ignore: unnecessary_null_comparison
      if (images != null) {
        setState(() {
          pickedImages.addAll(images);
        });
      } else {
        setState(() {
          pickedImages = images;
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> uploadImages({required List<String> imagesPathes}) async {
    FormData formData = FormData();
    for (var file in imagesPathes) {
      formData.files.add(
        MapEntry(
          'images[]',
          await MultipartFile.fromFile(
            file,
          ),
        ),
      );
    }
    Dio()
        .post(
      'https://httpbin.org/post',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    )
        .then((value) {
      if (kDebugMode) {
        print(value.data['files']);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload image',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    pickFromCamera();
                  },
                  child: const Text('Camera'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    pickFromGallery();
                  },
                  child: const Text('Gallery'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                uploadImages(
                  imagesPathes: pickedImages.map(
                    (e) {
                      return e.path;
                    },
                  ).toList(),
                );
              },
              child: const Text('Upload'),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.file(
                      File(
                        pickedImages[index].path,
                      ),
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    GestureDetector(
                      onTap: () {
                        removeImage(imagePath: pickedImages[index].path);
                      },
                      child: Container(
                        color: Colors.red,
                        width: 20,
                        height: 20,
                        child: const Text('X'),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: pickedImages.length,
            ),
          ],
        ),
      ),
    );
  }
}
