import 'package:flutter/material.dart';

import '../../res/ConstantColors.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.defaultSize! * Dimens.size2),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * Dimens.size3,
          vertical: SizeConfig.defaultSize! * Dimens.sizePoint5),
      width: SizeConfig.defaultSize! * Dimens.size80,
      decoration: BoxDecoration(
        border: Border.all(
            color: ConstantColors.darkGreyColor,
            width: SizeConfig.defaultSize! * Dimens.sizePoint1),
        borderRadius:
            BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size29),
      ),
      child: child,
    );
  }
}
