// ignore_for_file: avoid_print

// Create a map representing a dictionary (word -> meaning). Add new words and their meanings to the map.

void main() {
  Map<String, String> dictionary = {
    'apple': 'A round fruit with red or green skin and a whitish interior',
    'banana': 'A long curved fruit that grows in clusters and has soft pulpy flesh',
  };
  dictionary['orange'] = 'A round juicy citrus fruit with a tough bright reddish-yellow rind';
  print(dictionary);
}
