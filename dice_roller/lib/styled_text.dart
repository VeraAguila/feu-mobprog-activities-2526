import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText (this.text,{super.key});

  final String text;
  @override
  Widget build(context){
    return Text(
              text,
              style: TextStyle(
                //color: Colors.white,149, 167, 141
                color: Color.fromARGB(255, 248, 118, 102),
                fontSize: 28,
              ),
           );
  }

}