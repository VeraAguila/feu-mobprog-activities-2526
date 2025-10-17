import 'package:aguila_fa3/model/items.dart';

final List<Items> registeredItems = [
  
  //DRINKS
  Items(
    title: 'Coke Zero',
    amount: 25.75,
    category: Category.drinks,
    photo: 'assets/photos/cokezero.png',
  ),
  Items(
    title: 'Lemon Iced Tea',
    amount: 45.25,
    category: Category.drinks,
    photo: 'assets/photos/icedtea.png',
  ),
  Items(
    title: 'Iced Coffee',
    amount: 40.50,
    category: Category.drinks,
    photo: 'assets/photos/icedcoffee.png',
  ),

  //SNACKS
  Items(
    title: 'French Fries',
    amount: 50.15,
    category: Category.snacks,
    photo: 'assets/photos/frenchfries.png',
  ),
  Items(
    title: 'Cheeseburger',
    amount: 75.22,
    category: Category.snacks,
    photo: 'assets/photos/burger.png',
  ),
  Items(
    title: 'Nachos',
    amount: 65.50,
    category: Category.snacks,
    photo: 'assets/photos/nachos.png',
  ),

  //MEALS
  Items(
    title: 'Chicken Adobo with Rice',
    amount: 120.85,
    category: Category.meals,
    photo: 'assets/photos/chickenadobo.png',
  ),
  Items(
    title: 'Spaghetti with Garlic Bread',
    amount: 95.20,
    category: Category.meals,
    photo: 'assets/photos/spaghetti.png',
  ),
  Items(
    title: 'Pork Sisig Rice Meal',
    amount: 130.75,
    category: Category.meals,
    photo: 'assets/photos/sisig.png',
  ),
];
