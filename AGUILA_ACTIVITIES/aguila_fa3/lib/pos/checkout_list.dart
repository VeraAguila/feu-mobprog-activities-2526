import 'package:aguila_fa3/model/items.dart';
import 'package:aguila_fa3/pos/showcheckout.dart';
import 'package:flutter/material.dart';

class CheckoutListItem extends StatelessWidget {
  const CheckoutListItem({
    super.key,
    required this.items,
    required this.removeItem,
  });

  final List<CheckoutItems> items;
  final void Function(CheckoutItems items) removeItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.2),
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(items[index]),
        onDismissed: (direction) {
          removeItem(items[index]);
        },
        child: ShowItem(
          items[index]
        ),
      ),
    );
  }
}
