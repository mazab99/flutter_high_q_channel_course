import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class PaginatedDropDown extends StatelessWidget {
  const PaginatedDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HighQPaginatedDropdown<Data>.paginated(
              paginatedRequest: (int? page, String? searchText) async {
                final paginatedData = await getAnimeList(
                  queryParameters: {
                    'page': page,
                    'q': searchText,
                  },
                );
                return paginatedData?.data!.map((e) {
                  return MenuItemModel<Data>(
                    label: e.title ?? '',
                    value: e,
                    onTap: () {
                      if (kDebugMode) {
                        print(e.title);
                      }
                    },
                    child: Text(e.title ?? ''),
                  );
                }).toList();
              },
              backgroundDecoration: (Widget child) {
                return Container(
                  child: child,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                );
              },
              trailingClearIcon: Icon(
                Icons.cleaning_services_rounded,
                color: Colors.red,
              ),
              hasTrailingClearIcon: false,
              loadingWidget: CircularProgressIndicator(color:Colors.green,),
            ),
          ],
        ),
      ),
    );
  }
}

class Model {
  List<Data>? data;

  Model({this.data});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      data: (json["data"] as List).map((e) => Data.fromJson(e)).toList(),
    );
  }
}

class Data {
  int? mal_id;
  String? title;

  Data({
    this.mal_id,
    this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json['title'],
      mal_id: json['mal_id'],
    );
  }
}

Future<Model?> getAnimeList({
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    String url = "https://api.jikan.moe/v4/anime";

    Response<dynamic> response = await Dio()
        .get(
      url,
      queryParameters: queryParameters,
    )
        .then((value) {
      return value;
    });
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    return Model.fromJson(response.data);
  } catch (exception) {
    throw Exception(exception);
  }
}
