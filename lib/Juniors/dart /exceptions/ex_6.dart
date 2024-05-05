// ignore_for_file: avoid_print

void main() {
  // Question: How do you handle an out-of-range exception when accessing a list index in Dart?
  // Answer: You can handle an out-of-range exception when accessing a list index in Dart using a try-on-catch block with a specific catch for RangeError.

  try {
    var myList = [1, 2, 3];
    print(myList[5]); // This will throw a RangeError
  } on RangeError catch (e) {
    print('Caught a RangeError: $e'); // Output: Caught a RangeError: RangeError (index): Index out of range: index should be less than 3
  } catch (e) {
    print('Caught an exception: $e');
  } finally {
    print('Finally block executed'); // Output: Finally block executed
  }
}
