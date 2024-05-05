// ignore_for_file: avoid_print

//Write Constructor Single Line

class Person {
  String? name;
  int? age;
  String? subject;
  double? salary;

  // Constructor in short form
  Person(this.name, this.age, this.subject, this.salary);

  // display method
  void display() {
    print("Name: $name");
    print("Age: $age");
    print("Subject: $subject");
    print("Salary: $salary");
  }
}

void main() {
  Person person = Person("John", 30, "Maths", 50000.0);
  person.display();
}
