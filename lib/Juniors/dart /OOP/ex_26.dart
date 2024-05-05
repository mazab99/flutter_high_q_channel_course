// ignore_for_file: avoid_print

//Try to create a class Person with two properties: name, and planet. Create a default constructor to initialize the values of the planet to earth. Create an object of the class Person, set the name to “Your Name” and print the name and planet.

class Person {
  String name;
  String planet;

  // Default constructor
  Person({this.name = "", this.planet = "Earth"});
}

void main() {
  // Create an object of the class Person
  Person person = Person(name: "Your Name");

  // Print the name and planet
  print("Name: ${person.name}");
  print("Planet: ${person.planet}");
}

