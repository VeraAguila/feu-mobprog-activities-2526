import 'package:aguila_fa3/model/items.dart';
import 'package:aguila_fa3/pos/add_item.dart';
import 'package:aguila_fa3/data/checkoutItems_data.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu(this.item, {super.key});

  final Items item;

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  //List<CheckoutItems> checkoutList = [];
  
  void openItemModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewItem(
        item: widget.item,
        addItem: addItem,
      ),
    );
  }

  void addItem(Items item, int qty) {
    final checkoutItem = CheckoutItems(
      title: widget.item.title,
      amount: widget.item.amount,
      category: widget.item.category,
      quantity: qty,
      photo: widget.item.photo,
    );

    setState(() {
      checkoutList.add(checkoutItem);
    });

    //final itemIndex = checkoutList.indexOf(checkoutItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Item added.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              checkoutList.remove(checkoutItem);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openItemModal,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.item.photo,
                      height: 100,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Row(
              //   children: [
              //     Text(
              //       item.title,
              //       style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //         fontSize: 16,
              //       ),
              //     ),
              //     //Spacer(),
              //     //Icon(categoryIcons[item.category], size: 20,),
              //   ],
              // ),
              Text(
                    widget.item.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                    ),
                  ),
              Text('\$${widget.item.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
