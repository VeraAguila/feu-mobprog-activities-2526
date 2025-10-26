import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_items.dart';
import 'package:shopping_app/model/grocery_item.dart';
import 'package:shopping_app/widgets/new_item.dart';


class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );

    if (newItem == null){
      return;
    }

    setState(() {
      groceryItems.add(newItem);
    });
  }

  void removeItem(GroceryItem item) {
    setState(() {
      groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No Items Added.'),
    );

    if(groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            removeItem(groceryItems[index]);
          },
          key: ValueKey(groceryItems[index].id),
          child: ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].foodCategory.color,
            ),
            trailing: Text(
              groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () {
              addItem();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
