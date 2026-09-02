import 'dart:io';

class BankAccount {
  String accountHolder;
  double balance;

  BankAccount(this.accountHolder, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Rs. $amount deposited successfully.');
    } else {
      print('Invalid amount.');
    }
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Invalid amount.');
    } else if (amount > balance) {
      print('Insufficient balance.');
    } else {
      balance -= amount;
      print('Rs. $amount withdrawn successfully.');
    }
  }

  void showBalance() {
    print('Account Holder: $accountHolder');
    print('Current Balance: Rs. ${balance.toStringAsFixed(2)}');
  }
}

void main() {
  print('===== Simple Bank System =====');

  stdout.write('Enter account holder name: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter initial balance: ');
  double balance = double.parse(stdin.readLineSync()!);

  BankAccount account = BankAccount(name, balance);

  while (true) {
    print('\n===== MENU =====');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Exit');

    stdout.write('Choose an option: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write('Enter deposit amount: ');
        double amount = double.parse(stdin.readLineSync()!);
        account.deposit(amount);
        break;

      case 2:
        stdout.write('Enter withdrawal amount: ');
        double amount = double.parse(stdin.readLineSync()!);
        account.withdraw(amount);
        break;

      case 3:
        account.showBalance();
        break;

      case 4:
        print('Thank you for using the bank system.');
        return;

      default:
        print('Invalid option.');
    }
  }
}
