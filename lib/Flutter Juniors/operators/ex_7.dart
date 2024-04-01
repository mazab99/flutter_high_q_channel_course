// ignore_for_file: avoid_print

//Write a program to calculate the factorial of a number.
void main() {
  int number = 5;
  int factorial = 1;
  for (int i = 1; i <= number; i++) {
    factorial *= i;
  }
  print("Factorial of $number: $factorial");
}
