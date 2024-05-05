// ignore_for_file: avoid_print

// Declare Named Optional  fun

// Function declaration with named optional parameters
void greet({required String name, String greeting = 'Hello'}) {
  print('$greeting, $name!');
}

void main() {
  // Calling the function with named arguments
  greet(name: 'Mahmoud'); // Output: Hello, Alice!
  greet(name: 'Ahmed', greeting: 'Hi'); // Output: Hi, Bob!
}
