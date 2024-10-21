// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  List<File> pickedFiles = [];
  List<String> pickedFilesNames = [];

  Future<void> pick() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
        ],
        allowMultiple: true,
      );
      if (result != null) {
        setState(() {
          for (var files in result.files) {
            pickedFiles.add(
              File(files.path!),
            );
            pickedFilesNames.add(
              files.name,
            );
          }
        });
      } else {
        setState(() {
          for (var files in result!.files) {
            pickedFiles.add(
              File(files.path!),
            );
            pickedFilesNames.add(
              files.name,
            );
          }
        });
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> upload({
    required List<String> pathes,
    required List<String> names,
  }) async {
    FormData formData = FormData();
    for (int i = 0; i < pathes.length; i++) {
      formData.files.add(
        MapEntry(
          'files[]',
          await MultipartFile.fromFile(
            pathes[i],
            filename: names[i],
          ),
        ),
      );
    }
    Dio().post(
      'https://file.io/?expires=1w',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
      onSendProgress: (count, total) {
        print('onSendProgress.......');
      },
    ).then((value) {
      print(value.data);
    }).catchError((error) {
      if (error is DioException) {
        print(error.response);
      }
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload File',
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
                MaterialButton(
                  onPressed: () {
                    pick();
                  },
                  color: Colors.redAccent,
                  colorBrightness: Brightness.dark,
                  child: const Icon(Icons.folder_open),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  onPressed: () {
                    upload(
                      pathes: pickedFiles
                          .map(
                            (e) => e.path,
                          )
                          .toList(),
                      names: pickedFilesNames.map((e) => e).toList(),
                    );
                  },
                  color: Colors.redAccent,
                  colorBrightness: Brightness.dark,
                  child: const Icon(Icons.upload),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 5),
                  ),
                  child: PDFView(
                    filePath: pickedFiles[index].path,
                    enableSwipe: true,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: pickedFiles.length,
            ),
          ],
        ),
      ),
    );
  }
}
