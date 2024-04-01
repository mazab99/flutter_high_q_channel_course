// ignore_for_file: avoid_print

// Write a program to find the largest among three numbers.

void main() {
  int a = 10;
  int b = 20;
  int c = 15;
  int largest = a;
  if (b > largest) {
    largest = b;
  }
  if (c > largest) {
    largest = c;
  }
  print("The largest number is $largest");
}
