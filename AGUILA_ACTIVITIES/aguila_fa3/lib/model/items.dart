import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  drinks,
  snacks,
  meals,
}

const categoryIcons = {
  Category.drinks: Icons.local_drink,
  Category.snacks: Icons.fastfood_sharp,
  Category.meals: Icons.set_meal_sharp,
};

class Items {
  Items ({
    required this.title,
    required this.amount,
    required this.category,
    required this.photo,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final Category category;
  final String photo;
}

class CheckoutItems {
  CheckoutItems ({
    required this.title,
    required this.amount,
    required this.category,
    required this.quantity,
    required this.photo,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final Category category;
  final int quantity;
  final String photo;

}

class ItemBucket {
  const ItemBucket({
    required this.category,
    required this.items,
  });

  ItemBucket.forCategory(List<CheckoutItems> allExpenses, this.category)
    : items = allExpenses
          .where((items) => items.category == category)
          .toList();

  final Category category;
  final List<CheckoutItems> items;

  double get totalExpenses {
    double sum = 0;

    for (final items in items) {
      sum += items.amount * items.quantity;
    }

    return sum;
  }
}