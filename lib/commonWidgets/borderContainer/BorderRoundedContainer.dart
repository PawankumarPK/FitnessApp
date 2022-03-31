import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/ConstantFonts.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';


class BorderRoundedContainer extends StatelessWidget {
  final String buttonText;

  final double buttonRadius;
  Color buttonColor;
  Color buttonTextColor;
  Color borderColor;
  double paddingLeft;
  double paddingRight;
  double paddingTop;
  double paddingBottom;
  double textPaddingAll;

  BorderRoundedContainer({
    required this.buttonText,
    required this.buttonRadius,
    this.buttonColor = Colors.white,
    this.buttonTextColor = Colors.black,
    this.borderColor = Colors.black12,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.textPaddingAll = 0.0,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: borderColor,
              width: SizeConfig.defaultSize! * Dimens.sizePoint1),
          color: buttonColor,
          borderRadius: BorderRadius.circular(buttonRadius)),

      ///------------------ Icon -------------------------------
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [

        ///------------------------------ Text --------------------------
        Padding(
          padding: EdgeInsets.only(
              right: paddingRight,
              left: paddingLeft,
              top: paddingTop,
              bottom: paddingBottom),
          child: Text(
            buttonText,
            style: TextStyle(
                color: buttonTextColor,
                fontFamily: ConstantFonts.poppinsSemiBold,
                fontSize: SizeConfig.defaultSize! * Dimens.size1Point3),
          ),
        ),
      ]),
    );
  }
}
