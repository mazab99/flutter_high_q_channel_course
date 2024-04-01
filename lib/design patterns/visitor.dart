// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

abstract class Visitor {
  void visitConcreteElementA(ConcreteElementA element);

  void visitConcreteElementB(ConcreteElementB element);
}

abstract class Element {
  void acceptVisitor(Visitor visitor);
}

class ConcreteElementA implements Element {
  @override
  void acceptVisitor(Visitor visitor) {
    visitor.visitConcreteElementA(this);
  }

  void operationA() {
    print("ConcreteElementA operationA");
  }
}

class ConcreteElementB implements Element {
  @override
  void acceptVisitor(Visitor visitor) {
    visitor.visitConcreteElementB(this);
  }

  void operationB() {
    print("ConcreteElementB operation");
  }
}

class ConcreteVisitor1 implements Visitor {
  @override
  void visitConcreteElementA(ConcreteElementA element) {
    element.operationA();
  }

  @override
  void visitConcreteElementB(ConcreteElementB element) {
    element.operationB();
  }
}

class ObjectStructure {
  final List<Element> _elements = [];

  void add(Element element) => _elements.add(element);

  void remove(Element element) => _elements.remove(element);

  void accept(Visitor visitor) {
    for (var element in _elements) {
      element.acceptVisitor(visitor);
    }
  }
}

void main() {
  ObjectStructure objectStructure = ObjectStructure();
  objectStructure.add(ConcreteElementA());
  objectStructure.add(ConcreteElementB());
  objectStructure.accept(ConcreteVisitor1());
}

Widget customButton({required List<TextEditingController> controllers}) {
  return ListenableBuilder(
    listenable: Listenable.merge(controllers),
    builder: (context, child) {
      final enableButton = controllers.map((e) => e.text).isNotEmpty;
      return MaterialButton(
        onPressed: enableButton
            ? () {
                print('The button is enabled now');
              }
            : null,
        child: const Text(
          'Done',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    },
  );
}
