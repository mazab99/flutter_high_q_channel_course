// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mahmoud/main.dart';

class SearchInDropDown extends StatelessWidget {
  const SearchInDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownSearch<CountriesModel>(
              asyncItems: (text) async {
                final Response response = await Dio().get(
                  SEARCH_URL,
                  queryParameters: {
                    "query": text,
                  },
                );

                final List<CountriesModel> countries =
                    CountriesModel.jsonToList(
                  response.data['data'],
                );
                return countries;
              },
              itemAsString: (item) {
                return item.name;
              },
              compareFn: (item1, item2) {
                return true;
              },
              dropdownBuilder: (context, selectedItem) {
                return Text(
                  selectedItem?.name ?? 'Search',
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                );
              },
              popupProps: PopupProps.menu(
                isFilterOnline: true,
                showSearchBox: true,
                showSelectedItems: true,
                loadingBuilder: (context, searchEntry) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
                itemBuilder: (context, item, isSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const Divider(
                          color: Colors.red,
                          thickness: 2,
                        ),
                      ],
                    ),
                  );
                },
                searchFieldProps: const TextFieldProps(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountriesModel {
  final int id;

  final String name;

  const CountriesModel({
    required this.id,
    required this.name,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> fromJson) {
    return CountriesModel(
      id: fromJson['id'],
      name: fromJson['name'],
    );
  }

  static List<CountriesModel> jsonToList(List? list) {
    if (list == null) return [];
    return list.map(
      (e) {
        return CountriesModel.fromJson(
          e,
        );
      },
    ).toList();
  }
}
