// ignore_for_file: avoid_print


//Q1:  What does the isFinite function check for in Dart's numbers?
//Answer: The isFinite function in Dart checks whether a number is finite,
// meaning it is not NaN (Not a Number) and not positive or negative infinity.


// Q : Can you provide an example of using isFinite in Dart?
bool isFiniteNumber(double number) {
  return number.isFinite;
}

void main() {
  double finiteNumber = 10.0;
  double infinity = double.infinity;
  double notANumber = double.nan;

  print(isFiniteNumber(finiteNumber)); // Output: true
  print(isFiniteNumber(infinity)); // Output: false
  print(isFiniteNumber(notANumber)); // Output: false
}
