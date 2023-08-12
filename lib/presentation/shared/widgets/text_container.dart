import 'package:flutter/material.dart';

class TextTutorial extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontW;
  final double fontSize;
  const TextTutorial({super.key, required this.text,required this.fontSize,color,fontWeight})
      : textColor = color ?? Colors.black,fontW=fontWeight??FontWeight.w500;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:textColor,
        fontSize: fontSize,
        fontWeight: fontW
      ),
    );
  }
}
