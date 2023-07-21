// Importing dart:io file
// import 'dart:io';
// import 'dart:math';

// void main() {
// 	print("Enter your a number for a:");
// 	num? a = num.parse(stdin.readLineSync()!);

// 	print("Enter your a number for b:");
// 	num? b = num.parse(stdin.readLineSync()!);

	

// 	add_result = performOperation(a, b, operator: add(a,b));
// 	subtract_result = performOperation(a, b, operator: subtract(a,b));
// 	multiply_result = performOperation(a, b, operator: multiply(a,b));
// 	divide_result = performOperation(a, b, operator: divide(a,b));

// 	print("add result: $add_result \nsubtract result: $subtract_result \nmultiply result: $multiply_result \ndivide result: $divide_result");
// }

// num add(num a, num b) {
// 	num result = a + b;

// 	return result;
// }

// num subtract(num a, num b) {
// 	num result = a - b;

// 	return result;
// }

// num multiply(num a, num b) {
// 	num result = a * b;

// 	return result;
// }

// num divide(num a, num b) {
// 	num result = a/b;

// 	return result;
// }

// performOperation({required num a, required num b, required num Function(num, num) operator}){
// 	return (a, b);
// }



// int myFunc({required int parameter, required String parameter2}) {
// 	print('object');

// 	return 0;
// }

// void main() {
// 	myFunc(parameter: 10, parameter2: '20');
// }

// more on string
// void main() {
// 	String name = "Norna";
// 	int age = 25;
// 	String result = "My name is $name,\n I'm ${age-2} years old.";

// 	final int value1 = 10;
// 	final int value2 = 10;
// 	final int value3 = value1 + value2;

// 	//  \n new line
// 	// \t tab
// 	// \$ dollar sign
// 	//  \' single quote
// 	// \" double quote

// 	print(result);
// 	print(result.contains("Nona"));
// 	print(value3);
// }

// activity 5
// void main() {
// 	print("Enter your age:");
// 	final age = int.parse(stdin.readLineSync()!);

// 	print("Enter your job title:");
// 	final job = stdin.readLineSync(); // null safety in name string
	
// 	print("Enter your salary:");
// 	final salary = int.parse(stdin.readLineSync()!);

// 	print("Enter your marital status");
// 	final marital = stdin.readLineSync(); // null safety in name string

// 	if (age >= 18 && job == "Software Engineer" && (salary > 60000 && marital == "married")) {
// 		print ("Candidate fits the criteria");
// 	} else {
// 		print ("Candidate does not fit the criteria");
// 	}
// }

// void main() {
	// String name = 'bob';
	// int age = 30;
	// int sumAge = age + 5;
	// int another = 7 ~/ 2;

	// print ("Hello World");
	// double withDouble = 7/2;
	// int withInt = 7~/2;
	// int another = 7%2;

	// print(withDouble);
	// print(withInt);
	// print(another);

	// Assignment Operators
	// int age = 10;
	// int sumage = 30 + 5;
	// age *= 3;

	// print(age);
	// print(sumage);

	// conditional expression

// }
 

// activity 4
// void main() {
// 	print("Enter a decimal number:");
// 	double? num = double.parse(stdin.readLineSync()!);

// 	double squareroot = sqrt(num);
// 	int cuberoot = pow(num, 1/3).ceil();
// 	int up = num.ceil();
// 	int down = num.floor();

// 	print(squareroot);
// 	print(cuberoot);
// 	print(up);
// 	print(down);

// }


// Activity 3
// void main() {
// 	print("Enter the length of a rectangle:");
// 	double? a = double.parse(stdin.readLineSync()!);

// 	print("Enter the width of a rectangle:");
// 	double? b = double.parse(stdin.readLineSync()!);

// 	double area = (a*b);
// 	double perimeter = (a*2) + (b*2);
// 	double diagonal = sqrt((pow(a, 2)) + (pow(b, 2)));

// 	print("The area of the rectangle is $area.");
// 	print("The perimeter of the rectangle is $perimeter.");
// 	print("The length of the diagonal of the rectangle is $diagonal.");
// }

// Activity 2
// void main() {
// 	print("Enter your first number:");
// 	int? a = int.parse(stdin.readLineSync()!);

// 	print("Enter your second number:");
// 	int? b = int.parse(stdin.readLineSync()!);

// 	print("Enter your third number:");
// 	int? c = int.parse(stdin.readLineSync()!);

// 	int  x = (a*a*a) - (b*b) +c;
// 	print("The answer is $x.");
// }