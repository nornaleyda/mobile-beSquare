import './bank.dart';

// void main() {
//   var account1 = new SavingsAccount("1234", 1000.0, 0.02);
//   account1.addInterest();
//   print(account1);// should print "Account #1234, Balance: 1020.0"

//   var account2 = new CheckingAccount("5678", 500.0, -100.0);
//   account2.withdraw(200.00);
//   print(account2);// should print "Account #5678, Balance: 290.0"
//   account2.withdraw(200.00);
//   print(account2);// should print "Account #5678, Balance: -20.0"
//   account2.withdraw(10.0);
//   print(account2);// should print "Account #5678, Balance: -30.0"
// }

// class BankAccount {
//   String accountNumber;
//   double balance;

//   BankAccount(this.accountNumber, this.balance);

//   void deposit(double amount) {
//     balance += amount;
//   }

//   void withdraw(double amount) {
//     balance -= amount;
//   }

//   double getBalance() {
//     return balance;
//   }

//   @override
//   String toString() {
//     return "Account #$accountNumber, Balance: $balance";
//   }
// }

// class SavingsAccount extends BankAccount {
//   double interestRate;

//   SavingsAccount(String accountNumber, double balance, this.interestRate)
//       : super(accountNumber, balance);

//   void addInterest() {
//     double interest = balance * (interestRate / 12);
//     deposit(interest);
//   }
// }

// class CheckingAccount extends BankAccount {
//   double overdraftLimit;

//   CheckingAccount(String accountNumber, double balance, this.overdraftLimit)
//       : super(accountNumber, balance);

//   @override
//   void withdraw(double amount) {
//     if (balance - amount < -overdraftLimit) {
//       print("Insufficient funds for withdrawal");
//     }
//     balance -= amount;
//     if (balance < 0) {
//       balance -= 10;
//     }
//   }
// }

void main() {
  var account1 = new SavingsAccount("1234", 1000.0, 0.02);
  account1.addInterest();
  print(account1);

  var account2 = new CheckingAccount("5678", 500.0, -100.0);
  account2.withdraw(200.0);
  print(account2);
  account2.withdraw(200.0);
  print(account2);
  account2.withdraw(10.0);
  print(account2);
}