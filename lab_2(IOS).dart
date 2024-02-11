import 'package:flutter/material.dart';

class BankAccount {
  static int _nextAccountNumber = 1;

  int accountNumber;
  String accountOwner;
  double balance;

  BankAccount(this.accountOwner, this.balance) {
    accountNumber = _nextAccountNumber++;
  }

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
    }
  }

  double getBalance() {
    return balance;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BankAccount account = BankAccount("John Doe", 1000.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bank Account Management'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Account Information:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Account Number: ${account.accountNumber}'),
              Text('Account Owner: ${account.accountOwner}'),
              Text('Current Balance: \$${account.getBalance()}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  account.deposit(500.0);
                  updateUI();
                },
                child: Text('Deposit \$500'),
              ),
              ElevatedButton(
                onPressed: () {
                  account.withdraw(200.0);
                  updateUI();
                },
                child: Text('Withdraw \$200'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUI() {
    // Force the widget to rebuild and display the updated account information
    runApp(MyApp());
  }
}
