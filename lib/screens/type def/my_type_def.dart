import 'package:badges/badges.dart';

void main() {
  MNC mnc = MNC();
  mnc.printName();
}

// Syntax
// typedef newName = oldName;

typedef myBadge = Badge;


typedef stringList = List<String>;
typedef myInt = int;
typedef MNC = MyNewClass;

int c = 10;
myInt v = 15;

List<String> y = [];
stringList b = [];

class MyNewClass {
  void printName() {
    print('MAHMOUD');
  }
}
