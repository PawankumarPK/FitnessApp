import 'package:fitness_app/details/DetailsScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commonWidgets/borderContainer/BorderRoundedContainer.dart';
import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/Dimens.dart';
import '../../res/ImageAssets.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';

class DoctorCardWidget extends StatelessWidget {
  const DoctorCardWidget({
    Key? key,
    this.id,
    this.doctorName,
    this.doctorContactNo,
    this.state,
    this.specialist,
  }) : super(key: key);

  final id;
  final doctorName;
  final doctorContactNo;
  final state;
  final specialist;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.defaultSize! * Dimens.sizePoint5,
          horizontal: SizeConfig.defaultSize! * Dimens.sizePoint5),

      ///--------------------- Card View ------------------------------
      child: InkWell(
        onTap: () => {launch("tel://$doctorContactNo")},
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ///------------------------------- Tournament title --------------------------
          SizedBox(height: SizeConfig.defaultSize! * Dimens.size1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doctorName,
                style: TextStyle(
                    fontFamily: ConstantFonts.poppinsSemiBold,
                    color: ConstantColors.textBlackColor,
                    fontSize: SizeConfig.defaultSize! * Dimens.size2),
              ),
              Icon(
                Icons.call,
                color: ConstantColors.linkBlueColor,
              )
            ],
          ),

          Text(
            specialist,
            style: TextStyle(
                fontFamily: ConstantFonts.poppinsRegular,
                color: ConstantColors.darkGreyColor,
                fontSize: SizeConfig.defaultSize! * Dimens.size1),
          ),

          Text(
            state,
            style: TextStyle(
                fontFamily: ConstantFonts.poppinsRegular,
                color: ConstantColors.darkGreyColor,
                fontSize: SizeConfig.defaultSize! * Dimens.size1),
          ),
        ]),
      ),
    ));
  }
}

void detailFunction(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DetailsScaffold()));
}
