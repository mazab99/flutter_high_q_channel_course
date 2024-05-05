// ignore_for_file: avoid_print

// Function declaration with optional parameters and default values call it 3 time to show me cases of your fun
void greet({String name = 'Guest', String greeting = 'Hello'}) {
  print('$greeting, $name!');
}

void main() {
  // Calling the function without providing any arguments
  greet(); // Output: Hello, Guest!

  // Calling the function with one argument
  greet(name: 'Mahmoud'); // Output: Hello, Alice!

  // Calling the function with both arguments
  greet(name: 'Ahmed', greeting: 'Hi'); // Output: Hi, Bob!
}
