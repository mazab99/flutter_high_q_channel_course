// ignore_for_file: avoid_print

// Create a program that checks if a given element exists in a list or not.

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int searchElement = 3;
  if (numbers.contains(searchElement)) {
    print("$searchElement exists in the list.");
  } else {
    print("$searchElement does not exist in the list.");
  }
}
