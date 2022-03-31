import 'package:flutter/material.dart';

import '../../res/ConstantColors.dart';
import '../../res/ConstantStrings.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: SizeConfig.defaultSize! * Dimens.size10,
      width: SizeConfig.defaultSize! * Dimens.size10,
      child: CircularProgressIndicator()
    ));
  }
}
