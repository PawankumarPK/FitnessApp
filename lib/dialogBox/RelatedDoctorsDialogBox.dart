import 'dart:ui';
import 'package:fitness_app/details/widget/DoctorCardWidget.dart';
import 'package:fitness_app/res/ConstantColors.dart';
import 'package:fitness_app/res/Dimens.dart';
import 'package:fitness_app/utils/SizeConfig.dart';
import 'package:fitness_app/utils/model/RelatedDoctorsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelatedDoctorsDialogBox extends StatefulWidget {
  const RelatedDoctorsDialogBox({Key? key}) : super(key: key);

  @override
  _RelatedDoctorsDialogBoxState createState() =>
      _RelatedDoctorsDialogBoxState();
}

class _RelatedDoctorsDialogBoxState extends State<RelatedDoctorsDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size2),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size2),
          margin: EdgeInsets.only(
              top: SizeConfig.defaultSize! * Dimens.size3Point5),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size2),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, SizeConfig.defaultSize! * Dimens.size1),
                    blurRadius: SizeConfig.defaultSize! * Dimens.size1),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.defaultSize! * Dimens.size1,
              ),

              Text(
                "Related Doctor's",
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * Dimens.size1Point8,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * Dimens.size2,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: doctors.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, int index) {
                    var bodyType = doctors[index];
                    return DoctorCardWidget(
                      id: bodyType.id,
                      doctorName: bodyType.doctorName,
                      doctorContactNo: bodyType.contactNo,
                      specialist: bodyType.specialist,
                      state: bodyType.state,
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}
