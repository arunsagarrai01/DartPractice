import 'dart:io';

class ATM {
  double balance;
  int pin;

  ATM(this.balance, this.pin);

  void checkBalance() {
    print('\nCurrent Balance: Rs. ${balance.toStringAsFixed(2)}');
  }

  void deposit() {
    stdout.write('Enter deposit amount: ');
    double amount = double.parse(stdin.readLineSync()!);

    if (amount > 0) {
      balance += amount;
      print('Deposit successful.');
    } else {
      print('Invalid amount.');
    }
  }

  void withdraw() {
    stdout.write('Enter withdrawal amount: ');
    double amount = double.parse(stdin.readLineSync()!);

    if (amount <= 0) {
      print('Invalid amount.');
    } else if (amount > balance) {
      print('Insufficient balance.');
    } else {
      balance -= amount;
      print('Withdrawal successful.');
    }
  }
}

void main() {
  ATM atm = ATM(10000, 1234);

  print('===== ATM MACHINE =====');

  stdout.write('Enter PIN: ');
  int enteredPin = int.parse(stdin.readLineSync()!);

  if (enteredPin != atm.pin) {
    print('Incorrect PIN.');
    return;
  }

  while (true) {
    print('\n1. Check Balance');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Exit');

    stdout.write('Choose option: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        atm.checkBalance();
        break;

      case 2:
        atm.deposit();
        break;

      case 3:
        atm.withdraw();
        break;

      case 4:
        print('Thank you for using ATM.');
        return;

      default:
        print('Invalid option.');
    }
  }
}
