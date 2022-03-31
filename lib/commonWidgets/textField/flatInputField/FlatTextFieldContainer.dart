import 'package:flutter/material.dart';

import '../../../res/ConstantColors.dart';
import '../../../res/Dimens.dart';
import '../../../utils/SizeConfig.dart';

class FlatTextFieldContainer extends StatelessWidget {
  final Widget child;

  const FlatTextFieldContainer({
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
          color: Colors.black,
        border: Border.all(
            color: ConstantColors.tagTextColor,
            width: SizeConfig.defaultSize! * Dimens.sizePoint1),
      ),
      child: child,
    );
  }
}
