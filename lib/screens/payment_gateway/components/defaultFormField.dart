import 'package:flutter/material.dart';
import 'package:fongi/constants.dart';

// ignore: must_be_immutable
class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final String? Function(String? value) validate;
  Color? prefixIconColor;
  Color labelColor;
  Color borderColor;
  Color selectedBorderColor;
  Color? textInputColor;
  double borderRadius;
  VoidCallback? onTap;
  Function(String)? onChange;
  IconData? suffixIcon;
  VoidCallback? suffixPressed;
  Function(String)? onSubmit;
  bool isPassword;
   DefaultFormField({
    Key? key,
     required this.controller,
     required this.label,
     required this.inputType,
     required this.validate,
     this.prefixIconColor,
     this.labelColor = kMainColor,
     this.borderColor = kMainColor,
     this.selectedBorderColor = kMainColor,
     this.textInputColor,
     this.borderRadius = 10,
     this.onTap,
     this.onChange,
     this.suffixIcon,
     this.suffixPressed,
     this.onSubmit,
     this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
  }
}