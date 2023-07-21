import 'dart:io';
import 'dart:math';

// Activity 1
void main() {
  //first number
  print("Enter your first number:");
  int? n = int.parse(stdin.readLineSync()!);
  print("Your first number is $n");

  //second number
  print("Enter your second number:");
  int? m = int.parse(stdin.readLineSync()!);
  print("Your first number is $m");

  int sum = n + m;
  print("sum is $sum");

  int subtract = n - m;
  print(subtract);

  int multiply = n * m;
  print(multiply);

  int divide = n ~/ m;
  print(divide);
}
