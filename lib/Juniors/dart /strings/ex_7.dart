// ignore_for_file: avoid_print

void main() {
  // Question: How do you replace the first occurrence of a substring in a string in Dart?
  // Answer: You can replace the first occurrence of a substring in a string in Dart using the `replaceFirst` method.

  String myString = "Hello, World!";
  String newString = myString.replaceFirst("o", "i"); // "Helli, World!"
  print("replaceFirst: $newString");
}
