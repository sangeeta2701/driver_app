import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/colors.dart';

class DriverTextField extends StatelessWidget {
  const DriverTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.lableText,
      required this.keyBoardType,
      this.isObsecure = false,
      required this.maxLength});

  final TextEditingController controller;
  final String lableText;
  final String hintText;
  final TextInputType keyBoardType;
  final bool isObsecure;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: gColor),
      obscureText: isObsecure,
      keyboardType: keyBoardType,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
          labelText: lableText,
          hintText: hintText,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: gColor)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: gColor)),
          hintStyle: TextStyle(
            color: gColor,
            fontSize: 12,
          ),
          labelStyle: TextStyle(
            color: gColor,
            fontSize: 14,
          )),
    );
  }
}
