// ignore_for_file: avoid_print

//Question: Write a program to print a triangle pattern using nested loops.

void main() {
  int rows = 5;
  for (int i = 1; i <= rows; i++) {
    for (int j = 1; j <= i; j++) {
      print("* ");
    }
    print("");
  }
}
