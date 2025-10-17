import 'package:aguila_fa3/model/items.dart';
import 'package:aguila_fa3/pos/item_menu.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.items,
  });

  final List<Items> items;

  @override
  Widget build(BuildContext context) {
    final drinks = items.where((item) => item.category == Category.drinks).toList();
    final snacks = items.where((item) => item.category == Category.snacks).toList();
    final meals = items.where((item) => item.category == Category.meals).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (drinks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(categoryIcons[drinks[0].category]),
                    SizedBox(width: 8),
                    Text(
                      'Drinks',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                GridView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: drinks.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 3,
                  ),
                  itemBuilder: (ctx, index) {
                    return ItemMenu(drinks[index]);
                  },
                ),
              ],
            ),

          if (snacks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(categoryIcons[snacks[0].category]),
                    SizedBox(width: 8),
                    Text(
                      'Snacks',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                GridView.builder(
                  padding:  EdgeInsets.all(5),
                  itemCount: snacks.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 3,
                  ),
                  itemBuilder: (ctx, index) {
                    return ItemMenu(snacks[index]);
                  },
                ),
              ],
            ),

          if (meals.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(categoryIcons[meals[0].category]),
                    SizedBox(width: 8),
                    Text(
                      'Meals',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                GridView.builder(
                  padding:  EdgeInsets.all(5),
                  itemCount: meals.length,
                  shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 3,
                  ),
                  itemBuilder: (ctx, index) {
                    return ItemMenu(meals[index]);
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
