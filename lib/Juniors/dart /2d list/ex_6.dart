// ignore_for_file: avoid_print

// How do you iterate through a 2D list in Dart?

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  print('Iterating through the 2D list:');
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      print('Element at row $i, column $j: ${matrix[i][j]}');
    }
  }
}
