import 'package:flutter/material.dart';
import 'package:aguila_fa2/commons/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/squarepants.png',
              width: 300,
              height: 300,
              //color: Colors.white,
            ),
          ),
          StyledText('SpongeBob', 30, Color.fromARGB(255, 180,122,61)),
          // OutlinedButton(
          //   onPressed: (){}, 
          //   child: StyledText('Start', 20, Colors.white),
          // ),
          OutlinedButton.icon(
            onPressed: switchScreen, 
            label: StyledText('Start', 20, Colors.white),
            icon: Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              //foregroundColor: Color.fromARGB(255, 180,122,61)
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 174, 173, 13),
            ),
          ),
        ],
      ),
    );
  }
}
