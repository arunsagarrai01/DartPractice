import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();

  int secretNumber = random.nextInt(100) + 1;
  int attempts = 0;

  print('===== NUMBER GUESSING GAME =====');
  print('I have selected a number between 1 and 100.');

  while (true) {
    stdout.write('Enter your guess: ');

    int guess = int.parse(stdin.readLineSync()!);

    attempts++;

    if (guess < secretNumber) {
      print('Too low! Try again.');
    } else if (guess > secretNumber) {
      print('Too high! Try again.');
    } else {
      print('\n🎉 Congratulations!');
      print('You guessed the number correctly.');
      print('Number: $secretNumber');
      print('Attempts: $attempts');

      if (attempts <= 5) {
        print('Excellent! 🏆');
      } else if (attempts <= 10) {
        print('Good job!');
      } else {
        print('You can do better next time.');
      }

      break;
    }
  }
}