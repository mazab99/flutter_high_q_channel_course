// ignore_for_file: avoid_print

// Implement a program that checks if a certain value exists in a map or not.

void main() {
  Map<String, String> dictionary = {
    'apple': 'A round fruit with red or green skin and a whitish interior',
    'banana':
        'A long curved fruit that grows in clusters and has soft pulpy flesh',
  };
  bool exists = dictionary.containsValue(
      'A round fruit with red or green skin and a whitish interior');
  print(exists);
}
