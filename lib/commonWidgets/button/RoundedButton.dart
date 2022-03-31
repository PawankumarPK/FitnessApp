import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/ConstantFonts.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';
import 'ButtonContainer.dart';



class RoundedButton extends StatelessWidget {
  final String buttonText;
  final double buttonRadius;
  Color buttonColor;
  String icon;
  Color iconColor;
  Color buttonTextColor;
  double paddingLeft;
  double paddingRight;
  double paddingTop;
  double paddingBottom;
  double textPaddingAll;
  final Function(BuildContext) press;


  RoundedButton({
    required this.buttonText,
    required this.buttonRadius,
    this.buttonColor = Colors.black12,
    this.buttonTextColor = Colors.black12,
    this.icon = "",
    this.iconColor = Colors.black,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.textPaddingAll = 0.0,
    required this.press
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: paddingBottom),
      child: ButtonContainer(
          child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          )),
        ),
        child: Padding(
            padding: EdgeInsets.all(textPaddingAll),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize! * Dimens.size1),
                child: SvgPicture.asset(
                  icon,
                  color: iconColor,
                ),
              ),
              Text(
                buttonText,
                style: TextStyle(
                    color: buttonTextColor,
                    fontFamily: ConstantFonts.poppinsSemiBold,
                    fontSize: SizeConfig.defaultSize! * Dimens.size1Point7),
              ),
            ])),
              onPressed: () => press(context)

      )),
    );
  }
}
