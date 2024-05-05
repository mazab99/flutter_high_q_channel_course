// ignore_for_file: avoid_print

// How do you access individual elements in a 2D list in Dart?

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  int element = matrix[1][2]; // Accessing element at row 1, column 2
  print('Element at row 1, column 2: $element');
}
