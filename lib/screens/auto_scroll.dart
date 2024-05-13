import 'package:flutter/material.dart';

class AutoScrollScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  AutoScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> itemList = List.generate(
      20,
      (index) {
        return "Item $index";
      },
    );
    int viewWidth = 10;

    ScrollHelper.startAutoScrolling(
      itemList,
      _scrollController,
      viewWidth,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Scrolling Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
          );
        },
      ),
    );
  }
}
class ScrollHelper {
  static void startAutoScrolling(
      List itemList,
      ScrollController scrollController,
      int viewWidth,
      ) {
    if (itemList.isNotEmpty) {
      Future.delayed(
        const Duration(seconds: 1),
            () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(
              seconds: (itemList.length * viewWidth) ~/ 15,
            ),
            curve: Curves.linear,
          );
        },
      );
      scrollController.addListener(
            () {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            scrollController.jumpTo(0);
            Future.delayed(
              const Duration(seconds: 1),
                  () {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: Duration(
                    seconds: (itemList.length * viewWidth) ~/ 15,
                  ),
                  curve: Curves.linear,
                );
              },
            );
          }
        },
      );
    }
  }
}