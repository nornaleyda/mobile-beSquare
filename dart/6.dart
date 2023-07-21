void main() {
  int? numDays = 15;
  int? numMiles = 200;
  int? dailyRate = 50;

  if (numDays == null || numMiles == null || numMiles == null) {
    print("error in parameter");
    return;
  } else {
    if (numMiles <= 100) {
      double cost = double.parse(numDays.toString()) * dailyRate;
      print('Total cost is RM$cost');
    } else {
      double cost = numDays * dailyRate + (numMiles - 100) * 0.25;
      print('Total cost is RM$cost');
    }
  }
}
