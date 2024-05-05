// ignore_for_file: avoid_print

// Function that takes a list of integers as a parameter
void printList(List<int> numbers) {
  for (int number in numbers) {
    print(number);
  }
}

void main() {
  // Creating a list of integers
  List<int> myList = [1, 2, 3, 4, 5];

  // Calling the function and passing the list as an argument
  printList(myList);
}
