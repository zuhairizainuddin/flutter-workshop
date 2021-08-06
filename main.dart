import 'dart:io';

main() {
  // Wekcome the user
  print('Hello, we are happy to have you today');

  // Asks his name and save it
  print('May I know what is your name?');

  String? name = stdin.readLineSync();

  // Greets his name
  print('Well, hello $name!');
  print('How can we help you today?');

  // Asks what to buy
  print(
      'Here we sell various fruits. Which fruit do you want to buy?\n1. Apples\n2. Mangoes\n3. Durian');

  String? fruit1 = stdin.readLineSync();
  String? fruit2;
  String? fruit3;

  print('Do you want to buy another fruit? (y/n)');

  String? decision = stdin.readLineSync();

  confirmDecision1() {
    if (decision == 'y') {
      print('Please choose another fruit apart from $fruit1.');
      fruit2 = stdin.readLineSync();
      print('You have chosen $fruit2');
      print('Do you want to buy another fruit? (y/n)');
      decision = stdin.readLineSync();
    } else if (decision == 'n') {
      print('Thank you for buying from us. Please proceed to checkout');
    } else {
      print(
          'You have not answered the question properly. Do you want to buy another fruit? (y/n)');
      decision = stdin.readLineSync();
      confirmDecision1();
    }
  }

  confirmDecision1();

  confirmDecision2() {
    if (decision == 'y') {
      print('Please choose another fruit apart from $fruit1 and $fruit2');
      fruit3 = stdin.readLineSync();
      print('You have picked $fruit3');
    } else if (decision == 'n') {
      print('Thank you for buying from us. Please proceed to checkout');
    } else {
      print(
          'You have not answered the question properly. Do you want to buy another fruit? (y/n)');
      decision = stdin.readLineSync();
      confirmDecision2();
    }
  }

  if (decision != 'n') {
    confirmDecision2();
  }

  // Confirm how many items are purchased

  List<String?> validItems = [];

  confirmItems() {
    List<String?> totalItems = [fruit1, fruit2, fruit3];

    for (var fruit in totalItems) {
      if (fruit != null) {
        validItems.add(fruit);
      }
    }
  }

  confirmItems();

  print('You have bought ${validItems.length} items.\nThese are $validItems');

  // Payment

  int priceApple = 5;
  int priceMangoes = 3;
  int priceDurian = 10;

  int totalPrice = 0;

  calculatePrice() {
    for (var item in validItems) {
      if (item == 'Apple') {
        totalPrice = totalPrice + priceApple;
      } else if (item == 'Mango') {
        totalPrice = totalPrice + priceMangoes;
      } else if (item == 'Durian') {
        totalPrice = totalPrice + priceDurian;
      } else {
        return;
      }
    }
  }

  calculatePrice();

  print('The price for this is: $totalPrice');

  // Good bye
}
