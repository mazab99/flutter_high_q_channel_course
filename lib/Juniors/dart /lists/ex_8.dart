// ignore_for_file: avoid_print

void main() {
  // Question 1: How do you create a growable list in Dart?
  // Answer 1: You can create a growable list in Dart using the List constructor without specifying a size.
  List<int> growableList = [];
  growableList.add(1);
  growableList.add(2);
  growableList.add(3);

  print('Growable list: $growableList');

  // Question 2: What methods can you use to modify the size of a growable list in Dart?
  // Answer 2: You can modify the size of a growable list in Dart using methods like add, addAll, insert, remove, removeAt, clear, etc.
  growableList.add(4);
  growableList.addAll([5, 6]);
  growableList.removeAt(1);

  print('Updated growable list: $growableList');
}
