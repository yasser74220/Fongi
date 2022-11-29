import 'package:flutter/material.dart';
import 'package:fongi/constants.dart';

Widget defaultButton({
  required String text,
  required Function function,
  Color textColor = Colors.white,
  double? fontSize,
  FontWeight? fontWeight,
  Color color = kMainColor,
  double width = double.infinity,
  double radius = 0.0,
  bool isUpperCase = true,
}) => Container(
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

Widget defaultFormField({
  required TextEditingController controller,
  required String label,
  required TextInputType inputType,
  required String? Function(String? value) validate,

  Color? prefixIconColor,
  Color labelColor = kMainColor,
  Color borderColor = kMainColor,
  Color selectedBorderColor = kMainColor,
  Color? textInputColor,
  double borderRadius = 10,
  VoidCallback? onTap,
  Function(String)? onChange,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  Function(String)? onSubmit,
  bool isPassword = false,
}) =>
    TextFormField(
      style: TextStyle(
        color: textInputColor,
      ),
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
              color: selectedBorderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusColor: kMainColor,
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
      ),
      keyboardType: inputType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );