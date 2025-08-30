import 'package:dice_roller/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: GradientContainer(Color.fromARGB(255, 200, 198, 175), Color.fromARGB(255, 215, 208, 200)),
        appBar: AppBar(title: const Text('Dice Roller'), centerTitle: true),
        body: GradientContainer(
          const Color.fromARGB(255, 200, 198, 175),
          const Color.fromARGB(255, 215, 208, 200),
          child: const DiceRoller(), // 👈 your dice content goes here
        ),
        ),
      );
  }
}
