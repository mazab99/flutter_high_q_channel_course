// ignore_for_file: avoid_print


// Function to calculate the area of a rectangle
double calculateArea(double length, double width) {
  return length * width;
}

void main() {
  double area = calculateArea(5.0, 3.0);
  print('Area of rectangle: $area'); // Output: Area of rectangle: 15.0
}
