import 'package:flutter/material.dart';

import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';


class ButtonContainer extends StatelessWidget {
  final Widget child;

  const ButtonContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultSize! * Dimens.size80,
      child: child,
    );
  }
}
