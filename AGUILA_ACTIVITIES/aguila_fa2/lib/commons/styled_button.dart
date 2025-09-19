import 'package:aguila_fa2/commons/styled_text.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.buttonListener,
    this.color = Colors.white,
  });

  final String text;
  final void Function() buttonListener;
  final Color color;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: buttonListener,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      child: StyledText(text, 30, Color.fromARGB(255, 174, 173, 13)),
    );
  }
}
