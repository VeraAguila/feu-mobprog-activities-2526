import 'package:aguila_fa3/model/items.dart';
import 'package:flutter/material.dart';

class ShowItem extends StatelessWidget {
  const ShowItem(this.items, {super.key});

  final CheckoutItems items;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              items.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$${items.amount.toStringAsFixed(2)} x ${items.quantity}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      '\$${items.amount *items.quantity}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    //Icon(categoryIcons[items.category]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
