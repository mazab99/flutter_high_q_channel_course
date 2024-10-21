//Example 4: Multilevel Inheritance In Dart

class Car {
// Properties
  String? name;
  double? price;
}

class Tesla extends Car {
// Method to display the values of the properties
  void display() {
    print("Name: ${name}");
    print("Price: ${price}");
  }
}

class Model3 extends Tesla {
// Properties
  String? color;

// Method to display the values of the properties
  void display() {
    super.display();
    print("Color: ${color}");
  }
}

void main() {
// Create an object of Model3 class
  Model3 m = new Model3();
// setting values to the object
  m.name = "Tesla Model 3";
  m.price = 50000.00;
  m.color = "Red";
// Display the values of the object
  m.display();
}