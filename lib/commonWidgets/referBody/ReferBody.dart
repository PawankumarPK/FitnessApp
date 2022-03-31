import 'package:flutter/material.dart';

import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';


class ReferBody extends StatelessWidget {
  const ReferBody({Key? key, required this.bodyText, required this.visibility}) : super(key: key);

  final String bodyText;
  final bool visibility;


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * Dimens.size3,
            right: SizeConfig.defaultSize! * Dimens.size3,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    width: SizeConfig.defaultSize! * Dimens.sizePoint1),
                color: ConstantColors.textWhiteColor,
                borderRadius: BorderRadius.circular(
                    SizeConfig.defaultSize! * Dimens.size1)),
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
                          bodyText,
                          style: TextStyle(
                              color: ConstantColors.textBlackColor,
                              fontFamily: ConstantFonts.poppinsRegular,
                              fontSize: SizeConfig.defaultSize! *
                                  Dimens.size1Point4),
                        ),
                      ]),
                ),
              ]),
            ),
          ),
        ),

      ),
    );
  }
}