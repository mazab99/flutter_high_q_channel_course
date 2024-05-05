// ignore_for_file: avoid_print


// Declare Function with positional optional parameters


void greet(String name, [String greeting = 'Hello']) {
  print('$greeting, $name!');
}

void main() {
  // Calling the function with one and two arguments
  greet('Mahmoud'); // Output: Hello, Alice!
  greet('Ahmed', 'Hi'); // Output: Hi, Bob!
}






