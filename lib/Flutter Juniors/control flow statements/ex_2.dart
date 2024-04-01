// ignore_for_file: avoid_print

// Write a program that determines whether a given year is a leap year or not.

void main() {
  int year = 2024;
  if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
    print("$year is a leap year");
  } else {
    print("$year is not a leap year");
  }
}
