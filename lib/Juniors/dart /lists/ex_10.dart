// ignore_for_file: avoid_print

// Question: How do you iterate through the elements of a list in Dart?
// Answer: In Dart, you can iterate through the elements of a list using
// various methods. One common approach is to use a loop or the forEach method.

void main() {
  // Create a list of integers
  List<int> numbers = [1, 2, 3, 4, 5];

  // Iterate through the elements of the list using a for loop
  print('Using a for loop:');
  for (int i = 0; i < numbers.length; i++) {
    print('Element at index $i: ${numbers[i]}');
  }

  // Iterate through the elements of the list using a for-in loop
  print('\nUsing a for-in loop:');
  for (int number in numbers) {
    print('Element: $number');
  }

  // Iterate through the elements of the list using the forEach method
  print('\nUsing forEach method:');
  numbers.forEach(
    (number) {
      print('Element: $number');
    },
  );
}
