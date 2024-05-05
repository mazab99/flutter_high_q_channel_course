// ignore_for_file: avoid_print


void main() {
  // Example: What does a type error exception indicate in Dart?
  try {
    // Code that might throw a type error exception
    var myList = [1, 2, 3];
    print(myList['not an index']); // Trying to access a non-existent index
  } catch (e) {
    print('Caught a type error exception: $e');
  }
}


