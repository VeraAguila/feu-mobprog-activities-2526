import 'package:aguila_fa3/data/items_data.dart';
import 'package:aguila_fa3/pos/checkout_screen.dart';
import 'package:aguila_fa3/pos/item_list.dart';
import 'package:flutter/material.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() {
    return _PosScreenState();
  }
}

class _PosScreenState extends State<PosScreen> {

  void openCheckout () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CheckoutScreen()),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No items found.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    if (registeredItems.isNotEmpty) {
      mainContent = ItemList(
        items: registeredItems,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'POS System',
            //style: Theme.of(context).textTheme.titleLarge
          ),
        ),
        actions: [
          IconButton(
            onPressed: openCheckout,
            icon: Icon(Icons.shopping_cart_checkout_rounded),
          ),
        ],
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                //StyledText('Column 1', 12, Colors.black),
                Expanded(
                  //child: StyledText('Column 2', 12, Colors.black),
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                // Expanded(
                //   //child: Chart(expenses: registeredExpenses),
                //   child: StyledText('row expanded 1', 12, Colors.black),
                // ),
                Expanded(
                  //child: StyledText('row expanded 2', 12, Colors.black),
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
