// ignore_for_file: avoid_print

//Create a class Camera with properties: name, color, megapixel. Create a method called display which prints out the values of the three properties. Create two objects of the class Camera and call the method display.

class Camera {
  String name;
  String color;
  int megapixel;

  Camera(this.name, this.color, this.megapixel);

  void display() {
    print("Name: $name");
    print("Color: $color");
    print("Megapixel: $megapixel");
  }
}

void main() {
  Camera camera1 = Camera("Canon EOS R5", "Black", 45);
  Camera camera2 = Camera("Sony A7III", "Silver", 24);

  print("Camera 1:");
  camera1.display();

  print("\nCamera 2:");
  camera2.display();
}
