// ignore_for_file: avoid_print


void main() {
  // Question: What does the `codeUnits` property provide in Dart strings?
  // Answer: The `codeUnits` property in Dart strings returns a list of
  // the UTF-16 code units of the characters in the string.

  String myString = "Hello";
  List<int> codeUnits = myString.codeUnits; // [72, 101, 108, 108, 111]
  print("codeUnits: $codeUnits");
}

