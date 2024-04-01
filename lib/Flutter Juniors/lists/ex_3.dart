// ignore_for_file: avoid_print

// Write a program to find the sum of all elements in a list of numbers.
//" Use statements".
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  print("Sum: $sum");
}
