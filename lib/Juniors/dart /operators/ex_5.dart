// ignore_for_file: avoid_print

//Create a program that takes two numbers as input from the user and displays the result of dividing the first number by the second number.


import 'dart:io';

void main() {
  print("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  double result = num1 / num2;
  print("Result of division: $result");
}
