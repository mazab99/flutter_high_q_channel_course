// ignore_for_file: avoid_print

void main() {
  // Question: What does the `contains` method check for in Dart strings?
  // Answer: The `contains` method in Dart strings checks whether a substring
  // is present within the string.

  String myString = "Hello, World!";
  bool containsWorld = myString.contains("World"); // false
  print("contains: $containsWorld");
}
