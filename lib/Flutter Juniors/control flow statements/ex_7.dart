// ignore_for_file: avoid_print

//Write a program to generate the nth Fibonacci number using recursion.

//This program defines a recursive function fibonacci()
// which calculates the nth Fibonacci number.
// In the fibonacci() function, it checks if n is less than or equal to 1.
// If it is, it returns n.
// Otherwise, it recursively calls itself with n-1 and n-2,
// and adds the results together.
// This recursive approach calculates Fibonacci numbers efficiently
// but can be slow for large values of n.
int fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

void main() {
  int n = 10;
  print("Fibonacci number at position $n: ${fibonacci(n)}");
}
