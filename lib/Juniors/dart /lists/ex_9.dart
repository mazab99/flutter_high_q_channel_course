// ignore_for_file: avoid_print


//Question: How do you manipulate a list in Dart, including adding single and multiple elements, inserting elements at specific indices, removing elements, clearing the list, replacing a range of elements, and finding the index of a specific element?
//
// Answer: In Dart, you can manipulate a list using various methods:
// Use the add method to add a single element to the end of the list.
// Use the addAll method to add multiple elements from another list to the end of the list.
// Use the insert method to insert an element at a specific index.
// Use the insertAll method to insert multiple elements from another list at a specific index.
// Use the remove method to remove a specific element from the list.
// Use the clear method to remove all elements from the list.
// Use the replaceRange method to replace a range of elements in the list with new elements.
// Use the indexOf method to find the index of a specific element in the list.
void main() {
  // Create a growable list of integers
  List<int> myList = [];

  // Add elements to the list
  myList.add(1);
  myList.add(2);
  myList.add(3);

  // Add all elements from another list
  List<int> anotherList = [4, 5];
  myList.addAll(anotherList);

  // Insert an element at a specific index
  myList.insert(2, 6);

  // Insert all elements from another list at a specific index
  myList.insertAll(4, [7, 8]);

  // Remove an element from the list
  myList.remove(3);

  // Clear the list
  myList.clear();

  // Replace a range of elements with new elements
  myList.replaceRange(0, 2, [9, 10]);

  // Get the index of an element in the list
  int index = myList.indexOf(10);

  // Print the updated list and index
  print('Updated list: $myList');
  print('Index of 10: $index');
}
