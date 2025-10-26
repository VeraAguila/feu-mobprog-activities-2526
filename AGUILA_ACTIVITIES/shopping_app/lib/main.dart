import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark,
          surface: Colors.green,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 158, 158, 158),
      ),
      home: GroceryList(),
    );
  }
}
