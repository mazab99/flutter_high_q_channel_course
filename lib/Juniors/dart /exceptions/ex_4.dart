// ignore_for_file: avoid_print


void main() {
  // Example: How do you handle an out-of-range exception in Dart?
  try {
    // Code that might throw an out-of-range exception
    var myList = [1, 2, 3];
    print(myList[5]); // Trying to access an index that doesn't exist
  } catch (e) {
    print('Caught an out-of-range exception: $e');
  }
}

