// ignore_for_file: avoid_print

// Parameterized Constructor With Default Values In Dart
class Student {
  String? name;
  int? age;

  // Constructor
  Student({String? name = "John", int? age = 0}) {
    this.name = name;
    this.age = age;
  }
}

void main(){
  // Here student is object of class Student.
  Student student = Student();
  print("Name: ${student.name}");
  print("Age: ${student.age}");
}
