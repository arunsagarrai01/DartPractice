import 'dart:io';

class Student {
  String name;
  List<double> marks;

  Student(this.name, this.marks);

  double calculateAverage() {
    double total = 0;

    for (double mark in marks) {
      total += mark;
    }

    return total / marks.length;
  }

  String getGrade() {
    double average = calculateAverage();

    if (average >= 80) {
      return 'A';
    } else if (average >= 70) {
      return 'B';
    } else if (average >= 60) {
      return 'C';
    } else if (average >= 50) {
      return 'D';
    } else {
      return 'F';
    }
  }

  void displayResult() {
    print('\nStudent: $name');
    print('Marks: $marks');
    print('Average: ${calculateAverage().toStringAsFixed(2)}');
    print('Grade: ${getGrade()}');
  }
}

void main() {
  print('===== Student Grade System =====');

  stdout.write('Enter student name: ');
  String name = stdin.readLineSync()!;

  List<double> marks = [];

  for (int i = 1; i <= 5; i++) {
    stdout.write('Enter mark for subject $i: ');
    double mark = double.parse(stdin.readLineSync()!);
    marks.add(mark);
  }

  Student student = Student(name, marks);

  student.displayResult();
}
