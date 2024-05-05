// ignore_for_file: avoid_print

//Constructor With Named Parameters
class Chair {
  String? name;
  String? color;

// Constructor
  Chair({this.name, this.color});

// Method
  void display() {
    print("Name: ${this.name}");
    print("Color: ${this.color}");
  }
}

void main() {
  Chair chair = Chair(name: "Chair1", color: "Red");
  chair.display();
}
