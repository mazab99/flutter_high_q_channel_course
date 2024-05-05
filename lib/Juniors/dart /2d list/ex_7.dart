// ignore_for_file: avoid_print

// How would you efficiently search for a specific element in a large 2D list in Dart, and what would be the time complexity of your approach?


// Answer: To efficiently search for a specific element in a large 2D list in Dart,
// you can use a binary search algorithm. However, for this approach to work,
// the 2D list must be sorted row-wise or column-wise.
// If the 2D list is sorted row-wise,
// you can perform a binary search on each row to find the target element.
// Similarly, if the list is sorted column-wise,
// you can perform a binary search on each column.


int binarySearch(List<int> row, int target) {
  int low = 0;
  int high = row.length - 1;

  while (low <= high) {
    int mid = low + ((high - low) ~/ 2);
    if (row[mid] == target) {
      return mid;
    } else if (row[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return -1; // Element not found
}

int searchIn2DList(List<List<int>> matrix, int target) {
  for (List<int> row in matrix) {
    int index = binarySearch(row, target);
    if (index != -1) {
      return index;
    }
  }
  return -1; // Element not found
}

void main() {
  List<List<int>> matrix = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 50],
  ];

  int target = 16;
  int index = searchIn2DList(matrix, target);
  if (index != -1) {
    print('Element $target found at index $index');
  } else {
    print('Element $target not found');
  }
}
