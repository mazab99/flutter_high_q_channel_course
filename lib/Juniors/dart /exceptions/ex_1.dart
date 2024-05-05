// ignore_for_file: avoid_print

void main() {
  // Example: What happens if a division by zero occurs in Dart?
  try {
    // Code that might cause a division by zero
    var result = 5 ~/ 0;
    print('Result: $result'); // This line won't be reached
  } catch (e) {
    print('Caught a division by zero exception: $e');
  }
}
