import 'package:aguila_fa3/model/items.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key, required this.item, required this.addItem});

  final Items item;
  final void Function(Items item, int quantity) addItem;

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  int quantity = 1;

  double get totalPrice => widget.item.amount * quantity;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(20),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         widget.item.title,
    //         style: Theme.of(context).textTheme.titleLarge,
    //       ),
    //       const SizedBox(height: 10),
    //       Image.asset(
    //         widget.item.photo,
    //         height: 100,
    //         fit: BoxFit.contain,
    //       ),
    //       const SizedBox(height: 10),
    //       Text(
    //         'Price per item: \$${widget.item.amount.toStringAsFixed(2)}',
    //         style: Theme.of(context).textTheme.titleMedium,
    //       ),
    //       const SizedBox(height: 20),

    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           IconButton(
    //             onPressed: decreaseQuantity,
    //             icon: const Icon(Icons.remove_circle_rounded),
    //           ),
    //           Text(
    //             quantity.toString(),
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .titleLarge!
    //                 .copyWith(fontWeight: FontWeight.bold),
    //           ),
    //           IconButton(
    //             onPressed: increaseQuantity,
    //             icon: const Icon(Icons.add_circle_rounded),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 10),
    //       Text(
    //         'Total: \$${totalPrice.toStringAsFixed(2)}',
    //         style: Theme.of(context)
    //             .textTheme
    //             .titleLarge!
    //             .copyWith(color: Theme.of(context).colorScheme.primary),
    //       ),

    //       const SizedBox(height: 20),

    //       // Add button
    //       ElevatedButton.icon(
    //         onPressed: () {
    //           widget.addItem(widget.item, quantity);
    //           Navigator.pop(context);
    //         },
    //         icon: const Icon(Icons.add_shopping_cart),
    //         label: const Text('Add to Checkout'),
    //       ),
    //     ],
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                widget.item.photo,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '\$${widget.item.amount.toStringAsFixed(2)} each',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: decreaseQuantity,
                icon: Icon(Icons.remove_circle_rounded),
              ),
              Text(
                quantity.toString(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: increaseQuantity,
                icon: Icon(Icons.add_circle_rounded),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Total: \$${totalPrice.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              widget.addItem(widget.item, quantity);
              Navigator.pop(context);
            },
            icon: Icon(Icons.add_shopping_cart),
            label: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
