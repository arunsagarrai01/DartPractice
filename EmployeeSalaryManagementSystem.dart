import 'dart:io';

class Employee {
  String name;
  double basicSalary;
  double bonus;

  Employee(this.name, this.basicSalary, this.bonus);

  double calculateSalary() {
    return basicSalary + bonus;
  }

  void display() {
    print('\nEmployee: $name');
    print('Basic Salary: Rs. ${basicSalary.toStringAsFixed(2)}');
    print('Bonus: Rs. ${bonus.toStringAsFixed(2)}');
    print('Total Salary: Rs. ${calculateSalary().toStringAsFixed(2)}');
  }
}

void main() {
  List<Employee> employees = [];

  print('===== Employee Salary System =====');

  stdout.write('How many employees? ');
  int number = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= number; i++) {
    print('\nEmployee $i');

    stdout.write('Enter name: ');
    String name = stdin.readLineSync()!;

    stdout.write('Enter basic salary: ');
    double salary = double.parse(stdin.readLineSync()!);

    stdout.write('Enter bonus: ');
    double bonus = double.parse(stdin.readLineSync()!);

    Employee employee = Employee(name, salary, bonus);

    employees.add(employee);
  }

  print('\n===== EMPLOYEE DETAILS =====');

  for (Employee employee in employees) {
    employee.display();
  }

  double totalSalary = 0;

  for (Employee employee in employees) {
    totalSalary += employee.calculateSalary();
  }

  print('\nTotal salary paid by company:');
  print('Rs. ${totalSalary.toStringAsFixed(2)}');
}
