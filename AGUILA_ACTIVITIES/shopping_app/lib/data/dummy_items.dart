import 'package:shopping_app/model/grocery_item.dart';
import 'package:shopping_app/data/food_categories.dart';
import 'package:shopping_app/model/food_category.dart';

final groceryItems = [
  GroceryItem(
    id: 'a',
    name: 'Kangkong',
    quantity: 2,
    foodCategory: foodCategories[FoodCategories.vegetables]!,
  ),
  GroceryItem(
    id: 'b',
    name: 'Apple',
    quantity: 6,
    foodCategory: foodCategories[FoodCategories.fruits]!,
  ),
  GroceryItem(
    id: 'c',
    name: 'Porkchop',
    quantity: 10,
    foodCategory: foodCategories[FoodCategories.meat]!,
  ),
];