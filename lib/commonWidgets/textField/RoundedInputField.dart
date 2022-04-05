import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import 'TextFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String icon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Color textColor;
  final int maxLength;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
    required this.textInputType,
    this.textColor = Colors.black,
    this.maxLength = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
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

          icon: SvgPicture.asset(
            icon,
            color: ConstantColors.darkGreyColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ConstantColors.darkGreyColor,
              fontFamily: ConstantFonts.poppinsRegular),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
