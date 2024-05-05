// ignore_for_file: avoid_print

void main() {
  // Example: How do you throw a custom exception in Dart?

  try {
    // Code that might throw a custom exception
    throw MyCustomException('This is a custom exception');
  } catch (e) {
    print('Caught a custom exception: $e');
  }
}

class MyCustomException implements Exception {
  final String message;

  MyCustomException(this.message);

  @override
  String toString() => 'MyCustomException: $message';
}
