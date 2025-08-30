import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dice_roller/styled_text.dart';

class GradientContainer extends StatelessWidget {
  // String name;
  // const GradientContainer(){
  //   name = "Britney";
  // }

  GradientContainer(this.color1, this.color2, {super.key, this.child});

  // ignore: unnecessary_question_mark
  final dynamic? color1, color2;
  final Widget? child;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: child ?? const StyledText("Dice Roller"),
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final Random random = Random();
  int index = 0;

  final List<String> diceImages = [
    'assets/dice/dice_1.png',
    'assets/dice/dice_2.png',
    'assets/dice/dice_3.png',
    'assets/dice/dice_4.png',
    'assets/dice/dice_5.png',
    'assets/dice/dice_6.png',
  ];

  void rollDice() {
    setState(() {
      index = random.nextInt(6); // random index 0–5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(diceImages[index], height: 100),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: rollDice,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Roll the dice',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

