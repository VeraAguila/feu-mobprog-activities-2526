import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText (this.text, this.fontSize, this.fontColor,{super.key});

  final String text;
  final double? fontSize;
  final dynamic fontColor;

  @override
  Widget build(context){
    // return Text(
    //           text,
    //           style: TextStyle(
    //             //color: Colors.white,149, 167, 141
    //             color: fontColor,
    //             fontSize: fontSize,
    //           ),
    //           textAlign: TextAlign.center,
    //        );
    return Text(
              text,
              style: GoogleFonts.sourceSans3(
                //color: Colors.white,149, 167, 141
                color: fontColor,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
           );
  }

}