// ignore_for_file: avoid_print

void main() {
  // Question: What does the `replaceRange` method do in Dart strings?
  // Answer: The `replaceRange` method in Dart strings replaces a range of characters with another string.

  String myString = "Hello, World!";
  String newString = myString.replaceRange(7, 12, "Universe"); // "Hello, Universe!"
  print("replaceRange: $newString");
}
