void main() {
  List<Map<String, String>> cartItems = [
    {"name": "Apples", "price": "1.99", "quantity": "2"},
    {"name": "Bananas", "price": "0.99", "quantity": "3"},
    {"name": "Oranges", "price": "2.49", "quantity": "1"},
  ];

  double taxRate = 0.1;
  double totalBeforeTax = 0;
  
  for (Map<String, String> item in cartItems) {
    double price = double.parse(item["price"]!);
    int quantity = int.parse(item["quantity"]!);
    totalBeforeTax += price * quantity;
  }

  double taxValue = totalBeforeTax * taxRate;
  double totalAfterTax = totalBeforeTax + taxValue;

  print("Items:");
  for (Map<String, String> item in cartItems) {
    print("${item["name"]} (${item["quantity"]}) - ${item["price"]}");
  }
  print("Total before tax: $totalBeforeTax");
  print("Tax: $taxValue");
  print("Total after tax: $totalAfterTax");
}
