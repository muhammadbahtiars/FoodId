import 'package:flutter/material.dart';

class TextWidgetReguler extends StatelessWidget {
  final Color textColor;
  final String text;
  final double fontSize;
  final double textWidth;
  final TextAlign textAlign;
  final FontWeight fontsWight;
  final double paddingHorizontal;

  // ignore: use_key_in_widget_constructors
  const TextWidgetReguler({
    required this.textColor,
    required this.text,
    required this.fontSize,
    required this.textWidth,
    required this.textAlign,
    required this.fontsWight,
    required this.paddingHorizontal,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: textWidth,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontsWight,
        ),
      ),
    );
  }
}
