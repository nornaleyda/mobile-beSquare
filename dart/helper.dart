import 'dart:io';
import 'dart:math';

String prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync()!;
}

abstract class BaseCharacter {
  void attack(Character character);
  bool isAlive();
  void doSomething();
}

class Character implements BaseCharacter {
  // class attributes
  late int health;
  final int strength;
  final String name;

  // constructor method
  Character(this.strength, this.name, this.health);

  void attack(Character character) {
    int damage = this.strength + Random().nextInt(10);
    character.health -= damage;

    print(
      '${this.name} attacked ${character.name} and deals $damage damage!',
    );
    print('${this.name} has ${this.health} health points left.');
    print('${character.name} has ${character.health} health points left.');
  }

  bool isAlive() {
    return health > 0;
  }

  void doSomething() {}
}

// encapsulation oop
class Player extends Character {
  Player(super.strength, super.name, super.health);

  void heal(int amount) {
    health += amount;
    health = health > 100 ? 100 : health;
    print('${name} healed 10 health points!');
    print('${name} has ${health} health points left.');
  }
}

class Monster extends Character {
  Monster(super.strength, super.name, super.health);

  @override
  bool isAlive() {
    return health > 10;
  }
}

// abstract class Animal {
//   void makeSound();
// }

// class Cat implements Animal {
//   void makeSound() {
//     print("meow");
//   }
// }

// class Dog implements Animal {
//   void makeSound() {
//     print("woof");
//   }
// }



