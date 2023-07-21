import "dart:io";

void main() {
  // print("Enter a number:");
  // num? a = num.parse(stdin.readLineSync()!);

  for (int i = 0; i < 7; i++) {
    switch (i) {
      case 0:
        stdout.write('Monday   ');
        break;
      case 1:
        stdout.write('Tuesday  ');
        break;
      case 2:
        stdout.write('Wednesday');
        break;
      case 3:
        stdout.write('Thursday ');
        break;
      case 4:
        stdout.write('Friday   ');
        break;
      case 5:
        stdout.write('Saturday ');
        break;
      case 6:
        stdout.write('Sunday   ');
        break;
      default:
        stdout.write('choose a different number!');
        break;
    }

    if (i < 5) {
      print(' (Weekdays)');
    } else {
      print(' (Weekend)');
    }
  }
  // print(a);
}
