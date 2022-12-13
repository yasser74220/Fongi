import 'package:flutter/material.dart';
import 'package:fongi/constants.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  final String text;
  final Function function;
  Color textColor;
  double? fontSize;
  FontWeight? fontWeight;
  Color color;
  double width;
  double radius;
  bool isUpperCase;
  DefaultButton({
    Key? key,
    required this.text,
    required this.function,
    this.textColor = Colors.white,
    this.fontSize,
    this.fontWeight,
    this.color = kMainColor,
    this.width = double.infinity,
    this.radius = 0.0,
    this.isUpperCase = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: (){
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}