// ignore_for_file: avoid_print

//Implement a program to find the GCD (Greatest Common Divisor)
// of two numbers using the Euclidean algorithm.

//Implement a program to find the GCD (Greatest Common Divisor)
// of two numbers using the Euclidean algorithm.
// This program defines a function gcd() which calculates the GCD of
// two numbers using the Euclidean algorithm.
// In the gcd() function, it repeatedly calculates the remainder
// of a divided by b until b becomes 0.
// At each step, the value of b becomes a and the remainder becomes b,
// and the process continues until b becomes 0.
// Finally, it returns the value of a, which is the GCD of the original
// two numbers.
int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

void main() {
  int num1 = 48;
  int num2 = 36;
  print("GCD of $num1 and $num2: ${gcd(num1, num2)}");
}
