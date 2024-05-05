// ignore_for_file: avoid_print

// Implement a program that removes duplicates from a list.

void main() {
  List<int> numbers = [1, 2, 2, 3, 4, 4, 5];
  Set<int> uniqueNumbers = numbers.toSet();
  List<int> uniqueList = uniqueNumbers.toList();
  print(uniqueList);
}
