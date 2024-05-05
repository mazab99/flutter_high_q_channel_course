// ignore_for_file: avoid_print


// Higher-order function that takes a function as a parameter along with additional parameters
void higherOrderFunction(void Function(int, String) callback, int number, String message) {
  // Call the callback function with arguments
  callback(number, message);
}

void main() {
  // Define a function that will be passed as a parameter
  void myCallback(int value, String message) {
    print('Callback function called with value: $value and message: $message');
  }

  // Call the higher-order function and pass myCallback as an argument
  higherOrderFunction(myCallback, 10, 'Hello');
}
