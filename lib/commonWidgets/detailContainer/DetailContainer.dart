import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/ConstantStrings.dart';
import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';
import '../borderContainer/BorderRoundedContainer.dart';

class DetailContainer extends StatelessWidget {
  final String title;
  final String description;
  String additionalText1;
  String additionalText2;
  Color greyColor;
  final bool readMoreButtonVisibility;
  final tabSelectionValue;


  DetailContainer(
      {required this.title,
      required this.description,
      this.additionalText1 = "",
      this.additionalText2 = "",
        this.greyColor = Colors.grey,
        required this.readMoreButtonVisibility,
        this.tabSelectionValue
      })
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.defaultSize! * Dimens.size2,
          right: SizeConfig.defaultSize! * Dimens.size2,
          top: SizeConfig.defaultSize! * Dimens.size2),

      ///----------------------- Grey Container ----------------------------
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: SizeConfig.defaultSize! * Dimens.sizePoint1),
            color: greyColor,
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size1)),
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size1, bottom: SizeConfig.defaultSize! * Dimens.size2),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            ///---------------------- title inside container -----------------------------
            Text(
              title,
              style: TextStyle(
                  color: ConstantColors.textBlackColor,
                  fontFamily: ConstantFonts.poppinsSemiBold,
                  fontSize: SizeConfig.defaultSize! * Dimens.size2),
            ),

            ///----------------------- Description -------------------------------
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size1,left: SizeConfig.defaultSize! * Dimens.size1),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                  child: Text(
                    description.replaceAll('/n', '\n'),
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: ConstantColors.textBlackColor,
                        fontFamily: ConstantFonts.poppinsSemiBold,
                        fontSize: SizeConfig.defaultSize! * Dimens.size1Point2),
                  ),
                ),

                ///--------------- Additional text1 for entering some another info about tournament--------------------
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.sizePoint5, right: SizeConfig.defaultSize! * Dimens.sizePoint5),
                  child: Text(
                    additionalText1,
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * Dimens.size1, fontWeight: FontWeight.bold),
                  ),
                ),

                    ///--------------- Additional text2 for entering some more info about tournament -----------------------
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.defaultSize! * Dimens.size1),
                  child: Text(
                    additionalText2,
                    style: TextStyle(
                        color: ConstantColors.textBlackColor,
                        fontFamily: ConstantFonts.poppinsSemiBold,
                        fontSize: SizeConfig.defaultSize! * Dimens.size1Point2),
                  ),
                ),

              ]),
            ),

            ///--------------------- Read more button -------------------------------
            Visibility(
              visible: readMoreButtonVisibility,
              child: InkWell(
                onTap: (){
                 // CustomObject.readMoreSelectedTab = tabSelectionValue;

                },
                child: Padding(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size2,right: SizeConfig.defaultSize! * Dimens.size2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Container(
                      width: SizeConfig.defaultSize! * Dimens.size10,
                      child: BorderRoundedContainer(
                        buttonText: ConstantStrings.readMore,
                        buttonRadius: SizeConfig.defaultSize! * Dimens.size10,
                        borderColor: ConstantColors.primaryColor,
                        paddingRight: SizeConfig.defaultSize! * Dimens.size1,
                      ),
                    ),
          ]
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
