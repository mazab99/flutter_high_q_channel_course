// ignore_for_file: avoid_print

void main() {
  // Question 1: How do you create a fixed-length list in Dart?
  // Answer 1: You can create a fixed-length list in Dart using the List constructor with the filled method to specify the initial size.
  List<int> fixedList = List<int>.filled(3, 0); // Creates a list with 3 elements filled with default value 0
  fixedList[0] = 1;
  fixedList[1] = 2;
  fixedList[2] = 3;

  // Attempting to add an element to a fixed-length list
  // This will result in an error: Unsupported operation: Cannot add to a fixed-length list
  // fixedList.add(4);

  print('Fixed-length list: $fixedList');

  // Question 2: What happens if you try to add an element to a fixed-length list beyond its initial size?
  // Answer 2: Attempting to add an element to a fixed-length list beyond its initial size will result in an error.
  try {
    fixedList.add(4);
  } catch (e) {
    print('Caught an exception: $e');
  }
}

