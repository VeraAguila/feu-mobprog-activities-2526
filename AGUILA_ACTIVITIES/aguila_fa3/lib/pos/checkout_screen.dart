import 'package:aguila_fa3/chart/chart.dart';
import 'package:aguila_fa3/data/checkoutItems_data.dart';
import 'package:aguila_fa3/login_screen.dart';
import 'package:aguila_fa3/model/items.dart';
import 'package:aguila_fa3/pos/checkout_list.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() {
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  void removeItem(CheckoutItems items) {
    final itemIndex = checkoutList.indexOf(items);

    setState(() {
      checkoutList.remove(items);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Item deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              checkoutList.insert(itemIndex, items);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double total = checkoutList.fold(
      0,
      (sum, item) => sum + (item.amount * item.quantity),
    );

    Widget mainContent = Center(
      child: Text(
        'No items.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    if (checkoutList.isNotEmpty) {
      mainContent = CheckoutListItem(
        items: checkoutList,
        removeItem: removeItem,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Text(
                'Checkout',
              ),
              Spacer(),
              Text('\$${total.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                Chart(items: checkoutList),
                Expanded(
                  child: mainContent,
                ),
                SizedBox(),
                ElevatedButton(
                  onPressed: () { 
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(items: checkoutList),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
