import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';

class ReferItemContainer extends StatelessWidget {
  final String text;
  final bool visibility;
  String coins;
  String icon;

  ReferItemContainer({
    Key? key,
    required this.text,
    this.coins = "",
    this.icon = "",
    required this.visibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * Dimens.size3,
            right: SizeConfig.defaultSize! * Dimens.size3,
            top: SizeConfig.defaultSize! * Dimens.size2),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: SizeConfig.defaultSize! * Dimens.sizePoint1),
              color: ConstantColors.lightGreyColor,
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size1)),
          child: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.defaultSize! * Dimens.size1Point5,
                bottom: SizeConfig.defaultSize! * Dimens.size1Point5),
            child: Stack(children: [
              ///---------------------- Text inside grey container -----------------------------

              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.defaultSize! * Dimens.size2),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            color: ConstantColors.textBlackColor,
                            fontFamily: ConstantFonts.poppinsSemiBold,
                            fontSize:
                                SizeConfig.defaultSize! * Dimens.size1Point4),
                      ),
                      Visibility(
                        visible: visibility,
                        child: Text(
                          coins,
                          style: TextStyle(
                              color: ConstantColors.textBlackColor,
                              fontFamily: ConstantFonts.poppinsRegular,
                              fontSize:
                                  SizeConfig.defaultSize! * Dimens.size1Point4),
                        ),
                      ),
                    ]),
              ),

              ///----------------------------- Expand Icon ---------------------------
              Positioned(
                right: 1,
                top: 1,
                bottom: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.defaultSize! * Dimens.size1),
                  child: SvgPicture.asset(
                    icon,
                    color: ConstantColors.textWhiteColor,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
