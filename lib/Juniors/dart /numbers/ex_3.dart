// ignore_for_file: avoid_print


// Can you parse numbers with different radixes (e.g., hexadecimal) in Dart?

void main() {
  String hexString = "1A";
  int number = int.parse(hexString, radix: 16);
  print(number);
}


