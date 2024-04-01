// ignore_for_file: avoid_print

// Write a program that retrieves and prints the value associated with
// a specific key in a map.

void main() {
  Map<String, dynamic> person = {
    'name': 'Mahmoud',
    'age': 25,
    'profession': 'Software Engineer',
  };
  print("Name: ${person['name']}");
}
