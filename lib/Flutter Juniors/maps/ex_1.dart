// ignore_for_file: avoid_print

//Create a map representing information about a person
// (name, age, profession). Print each key-value pair.

void main() {
  Map<String, dynamic> person = {
    'name': 'Mahmoud',
    'age': 25,
    'profession': 'Software Engineer',
  };
  person.forEach(
    (key, value) {
      print("$key: $value");
    },
  );
}
