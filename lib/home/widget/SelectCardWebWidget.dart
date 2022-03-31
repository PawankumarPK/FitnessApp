import 'package:fitness_app/details/DetailsScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commonWidgets/borderContainer/BorderRoundedContainer.dart';
import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/Dimens.dart';
import '../../res/ImageAssets.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';

class SelectCardWebWidget extends StatelessWidget {
  const SelectCardWebWidget(
      {Key? key,
      this.id,
      this.exerciseName,
      this.caloriesBurn,
      this.sets,
      this.reps,
      this.weightLift,
      this.imgString,
      this.fullDetails})
      : super(key: key);

  final id;
  final exerciseName;
  final caloriesBurn;
  final sets;
  final reps;
  final weightLift;
  final fullDetails;
  final imgString;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.defaultSize! * Dimens.size30,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize! * Dimens.sizePoint5,
              horizontal: SizeConfig.defaultSize! * Dimens.sizePoint5),

          ///--------------------- Card View ------------------------------
          child: Card(
            color: ConstantColors.textWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size1),
              side: BorderSide(
                  color: Colors.white70,
                  width: SizeConfig.defaultSize! * Dimens.sizePoint1),
            ),
            child: InkWell(
              onTap: () => {
                CustomObject.sets = sets,
                CustomObject.reps = reps,
                CustomObject.weightLift = weightLift,
                CustomObject.exerciseName = exerciseName,
                CustomObject.caloriesBurn = caloriesBurn,
                CustomObject.fullDetail = fullDetails,
                CustomObject.image = imgString,
                    detailFunction(context)},
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///-------------------------------- Image view container -------------------------
                    Container(
                      height: SizeConfig.defaultSize! * Dimens.size15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              SizeConfig.defaultSize! * Dimens.size1),
                          topRight: Radius.circular(
                              SizeConfig.defaultSize! * Dimens.size1),
                        ),
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            fit: BoxFit.fitWidth,
                            image: AssetImage(imgString)),
                      ),
                    ),

                    ///------------------------------- Tournament title --------------------------
                    SizedBox(height: SizeConfig.defaultSize! * Dimens.size1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.defaultSize! * Dimens.size1,
                              left: SizeConfig.defaultSize! * Dimens.size2),
                          child: Text(
                            exerciseName,
                            style: TextStyle(
                                fontFamily: ConstantFonts.poppinsSemiBold,
                                color: ConstantColors.textBlackColor,
                                fontSize: SizeConfig.defaultSize! *
                                    Dimens.size2),
                          ),
                        ),

                        ///------------------------- Free text container-----------------------
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.defaultSize! *
                                  Dimens.size1Point5,
                              top: SizeConfig.defaultSize! * Dimens.size1),
                          child:   Text(
                            caloriesBurn,
                            style: TextStyle(
                                color: ConstantColors.lightGreyColor,
                                fontSize: SizeConfig.defaultSize! *
                                    Dimens.size1Point2,
                                fontFamily:
                                ConstantFonts.poppinsSemiBold),
                          ),
                        ),
                      ],
                    ),

                    ///------------------------------------ Game title ----------------------------
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.defaultSize! * Dimens.size1Point5,
                          top: SizeConfig.defaultSize! * Dimens.size1Point5,
                          right: SizeConfig.defaultSize! * Dimens.size1),
                      child: Row(
                          children: [


                            ///---------------------- Squad/solo text container -------------------
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.defaultSize! *
                                      Dimens.sizePoint5),
                              child: BorderRoundedContainer(
                                buttonText: sets,
                                buttonRadius:
                                    SizeConfig.defaultSize! * Dimens.size10,
                                borderColor: ConstantColors.secondaryColor,
                                paddingTop:
                                SizeConfig.defaultSize! * Dimens.sizePoint6,
                                paddingBottom:
                                SizeConfig.defaultSize! * Dimens.sizePoint6,
                                paddingLeft:
                                SizeConfig.defaultSize! * Dimens.size1,
                                paddingRight:
                                SizeConfig.defaultSize! * Dimens.size1,
                              ),
                            ),

                            ///---------------------- Prize money text container ----------------------

                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.defaultSize! *
                                      Dimens.sizePoint5),
                              child: BorderRoundedContainer(
                                buttonText: reps,
                                buttonRadius:
                                    SizeConfig.defaultSize! * Dimens.size10,
                                borderColor: ConstantColors.yellowColor,
                                paddingTop:
                                    SizeConfig.defaultSize! * Dimens.sizePoint6,
                                paddingBottom:
                                    SizeConfig.defaultSize! * Dimens.sizePoint6,
                                paddingLeft:
                                    SizeConfig.defaultSize! * Dimens.size1,
                                paddingRight:
                                    SizeConfig.defaultSize! * Dimens.size1,
                              ),
                            ),

                            ///-------------------------- User joined container ---------------------------

                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.defaultSize! *
                                      Dimens.sizePoint5),
                              child: BorderRoundedContainer(
                                buttonText: "$weightLift",
                                buttonRadius:
                                    SizeConfig.defaultSize! * Dimens.size10,
                                buttonColor: ConstantColors.primaryColor,
                                borderColor: ConstantColors.primaryColor,
                                buttonTextColor: ConstantColors.textWhiteColor,
                                paddingTop:
                                SizeConfig.defaultSize! * Dimens.sizePoint6,
                                paddingBottom:
                                SizeConfig.defaultSize! * Dimens.sizePoint6,
                                paddingLeft:
                                SizeConfig.defaultSize! * Dimens.size1,
                                paddingRight:
                                SizeConfig.defaultSize! * Dimens.size1,
                              ),
                            ),
                          ]),
                    )
                  ]),
            ),
          ),
        ));
  }

}

void detailFunction(BuildContext context){

  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailsScaffold()));

}
