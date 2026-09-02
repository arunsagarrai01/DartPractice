import 'dart:io';

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  double getTotal() {
    return price * quantity;
  }
}

void main() {
  List<Product> cart = [];

  print('===== Shopping Cart =====');

  while (true) {
    print('\n1. Add Product');
    print('2. View Cart');
    print('3. Checkout');
    print('4. Exit');

    stdout.write('Choose option: ');
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      stdout.write('Enter product name: ');
      String name = stdin.readLineSync()!;

      stdout.write('Enter price: ');
      double price = double.parse(stdin.readLineSync()!);

      stdout.write('Enter quantity: ');
      int quantity = int.parse(stdin.readLineSync()!);

      Product product = Product(name, price, quantity);

      cart.add(product);

      print('$name added to cart.');
    } else if (choice == 2) {
      if (cart.isEmpty) {
        print('Your cart is empty.');
      } else {
        print('\n===== YOUR CART =====');

        for (Product product in cart) {
          print(
            '${product.name} x ${product.quantity} = Rs. ${product.getTotal()}',
          );
        }
      }
    } else if (choice == 3) {
      double total = 0;

      for (Product product in cart) {
        total += product.getTotal();
      }

      print('\n===== CHECKOUT =====');
      print('Total Amount: Rs. ${total.toStringAsFixed(2)}');

      if (total >= 5000) {
        double discount = total * 0.10;
        total -= discount;

        print('Discount: Rs. ${discount.toStringAsFixed(2)}');
      }

      print('Final Amount: Rs. ${total.toStringAsFixed(2)}');

      return;
    } else if (choice == 4) {
      print('Goodbye!');
      return;
    } else {
      print('Invalid option.');
    }
  }
}
