// ignore_for_file: avoid_print

// Recursive function to calculate factorial
int factorial(int n) {
  // Base case: if n is 0 or 1, factorial is 1
  if (n == 0 || n == 1) {
    return 1;
  }
  // Recursive case: n! = n * (n - 1)!
  else {
    return n * factorial(n - 1);
  }
}

void main() {
  // Calculate and print factorial of a number
  int num = 5;
  print('Factorial of $num: ${factorial(num)}');
}
