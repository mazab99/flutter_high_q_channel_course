// ignore_for_file: avoid_print

void main() {
  // Question: How do you handle a format exception when parsing a string to an integer in Dart?
  // Answer: You can handle a format exception when parsing a string to an integer in Dart using a try-on-catch block with a specific catch for FormatException.

  try {
    var result = int.parse('abc'); // This will throw a FormatException
    print('Result: $result'); // This line won't be reached
  } on FormatException catch (e) {
    print('Caught a FormatException: $e'); // Output: Caught a FormatException: FormatException: Invalid radix-10 number (at character 1)
  } catch (e) {
    print('Caught an exception: $e');
  }
}

