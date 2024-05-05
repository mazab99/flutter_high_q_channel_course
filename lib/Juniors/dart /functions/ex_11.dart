// ignore_for_file: avoid_print


//Explain the difference between named and positional parameters in Dart.

//Answer: Positional parameters in Dart functions are specified by their position in the parameter list,
// whereas named parameters are specified by name. Named parameters provide more flexibility and clarity,
// especially when functions have multiple optional parameters.

// Example of positional parameters
void printOrder(String item1, String item2) {
  print('Order: $item1, $item2');
}

// Example of named parameters
void printOrders({String? item1, String? item2}) {
  print('Order: $item1, $item2');
}
