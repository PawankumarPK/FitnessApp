import 'package:flutter/material.dart';

import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';


class BorderContainer extends StatelessWidget {
  final Widget child;

  const BorderContainer({
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
