// ignore_for_file: avoid_print

// Implement a program that prints the Fibonacci series
// up to a certain number of terms.

void main() {
  int n = 10;
  int a = 0, b = 1, c;
  print("Fibonacci series up to $n terms:");
  for (int i = 0; i < n; i++) {
    print("$a");
    c = a + b;
    a = b;
    b = c;
  }
}
