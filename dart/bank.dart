class BankAccount {
  String accountNumber;
  double balance;

  BankAccount(this.accountNumber, this.balance);

  void deposit(amount) {
    // balance = balance + amount;
    balance += amount;
  }

  void withdraw(double amount) {
    balance -= amount;
  }

  double getBalance() {
    return this.balance;
  }

@override
  String toString() {
    return "Account ${accountNumber}, Balance: ${balance}";
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(String accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  void addInterest() {
    double interest = balance * (interestRate / 12);
    deposit(interest);
  }
}

class CheckingAccount extends BankAccount {
  
  double overdraftLimit;

  CheckingAccount(String accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);
  
  @override
  void withdraw(double amount) {
    if (balance - amount < -overdraftLimit) {
      print("Insufficient funds for withdrawal");
    }
    balance -= amount;
    if (balance < 0) {
      balance -= 10;
    }
  }
}
