// ignore_for_file: avoid_print

//Implement a program to find the factorial of a number using recursion.

//This program defines a recursive function factorial()
// which calculates the factorial of a given number.
// In the factorial() function, it checks if the input number is 0.
// If it is, then the factorial is 1.
// Otherwise, it recursively calls itself with n-1 until it reaches 0.
// The base case is when n becomes 0, the function returns 1.
// Otherwise, it multiplies n with the result of factorial(n-1).
int factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}


void main() {
  int number = 5;
  int result = factorial(number);
  print("Factorial of $number: $result");
}
