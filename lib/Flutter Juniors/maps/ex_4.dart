// ignore_for_file: avoid_print

// Write a program that removes a key-value pair from a map
// based on a given key.

void main() {
  Map<String, String> dictionary = {
    'apple': 'A round fruit with red or green skin and a whitish interior',
    'banana':
        'A long curved fruit that grows in clusters and has soft pulpy flesh',
  };
  dictionary.remove('apple');
  print(dictionary);
}
