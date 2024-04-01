// ignore_for_file: avoid_print

//Create a program that prints the pattern of
// right-angled triangle using asterisks (*).

//This program prints a right-angled triangle pattern using nested loops.
// The outer loop iterates over the rows, and the inner loop iterates over
// the columns in each row.
// In each iteration of the inner loop, an asterisk is printed,
// and after completing each row, a newline character is printed to
// move to the next line.
void main() {
  int rows = 5;
  for (int i = 1; i <= rows; i++) {
    for (int j = 1; j <= i; j++) {
      print("* ");
    }
    print("");
  }
}

