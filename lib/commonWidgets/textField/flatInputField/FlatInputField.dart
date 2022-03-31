import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/ConstantColors.dart';
import '../../../res/ConstantFonts.dart';
import 'FlatTextFieldContainer.dart';

class FlatInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Color textColor;
  final int maxLength;

  const FlatInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    required this.textInputType,
    this.textColor = Colors.white,
    this.maxLength = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatTextFieldContainer(
      child: TextField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: textInputType,
        onChanged: onChanged,
        cursorColor: textColor,
        style: TextStyle(
            color: textColor,
            fontFamily: ConstantFonts.poppinsRegular),
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(
              color: ConstantColors.lightGreyColor,
              fontFamily: ConstantFonts.poppinsRegular),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
