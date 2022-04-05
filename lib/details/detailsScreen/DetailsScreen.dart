import 'package:fitness_app/commonWidgets/detailContainer/DetailContainer.dart';
import 'package:fitness_app/dialogBox/RelatedDoctorsDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../commonWidgets/borderContainer/BorderRoundedContainer.dart';
import '../../commonWidgets/button/RoundedButton.dart';
import '../../commonWidgets/progressIndicator/CustomProgressIndicator.dart';
import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/ConstantStrings.dart';
import '../../res/Dimens.dart';
import '../../res/ImageAssets.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';
import '../../utils/customObject/FlutterToast.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({ Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var flutterToast = new FlutterToast();
  bool isLoading = false;
  var bannerImage;

  var startingPeriod;
  var endingPeriod;

  var gameId;
  var gameName;

  var roomId;
  var roomPassword;

  var referId;

  List<dynamic> registerUserList = [];

  TextEditingController controller = TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CustomProgressIndicator())
        : Column(children: [
            ///------------------ Tournament Image ----------------------------
            Stack(children: [
              Container(
                height: SizeConfig.defaultSize! * Dimens.size25,
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
                          image: AssetImage(CustomObject.image)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.defaultSize! * Dimens.size3,
                      left: SizeConfig.defaultSize! * Dimens.size1Point5),
                  child: InkWell(
                    onTap: () => {
                      Navigator.pop(context)
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: ConstantColors.textWhiteColor,
                    ),
                  ),
                ),
              ),
            ]),

            ///----------------- Scrollable container --------------------------
            Flexible(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.defaultSize! * Dimens.size2,
                              right: SizeConfig.defaultSize! * Dimens.size2,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                ///-------------------- title ------------------------
                                Text(
                                  CustomObject.exerciseName,
                                  style: TextStyle(
                                      fontFamily:
                                          ConstantFonts.poppinsSemiBold,
                                      color: ConstantColors.textBlackColor,
                                      fontSize: SizeConfig.defaultSize! *
                                          Dimens.size2),
                                ),

                                ///------------------------- Share icon -----------------------
                                InkWell(
                                  onTap: ()=> {share(context)},
                                  child: SvgPicture.asset(
                                    ImageAssets.share,
                                    color: ConstantColors.darkGreyColor,
                                    height: SizeConfig.defaultSize! *
                                        Dimens.size3,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///----------- Tournament type,prize pool,joined user container ---------
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.defaultSize! *
                                    Dimens.size1Point5,
                                left: SizeConfig.defaultSize! * Dimens.size2),
                            child: Row(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.defaultSize! *
                                        Dimens.sizePoint5),
                                child: BorderRoundedContainer(
                                  buttonText:
                                      CustomObject.sets,
                                  buttonRadius:
                                      SizeConfig.defaultSize! * Dimens.size10,
                                  borderColor: ConstantColors.secondaryColor,
                                  paddingLeft: SizeConfig.defaultSize! * Dimens.size1,
                                  paddingRight: SizeConfig.defaultSize! * Dimens.size1,
                                  paddingTop: SizeConfig.defaultSize! * Dimens.sizePoint5,
                                  paddingBottom: SizeConfig.defaultSize! * Dimens.sizePoint5,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.defaultSize! *
                                        Dimens.sizePoint5),
                                child: BorderRoundedContainer(
                                  buttonText:
                                      CustomObject.reps,
                                  buttonRadius:
                                      SizeConfig.defaultSize! * Dimens.size10,
                                  borderColor: ConstantColors.yellowColor,
                                  paddingLeft: SizeConfig.defaultSize! * Dimens.size1,
                                  paddingRight: SizeConfig.defaultSize! * Dimens.size1,
                                  paddingTop: SizeConfig.defaultSize! * Dimens.sizePoint5,
                                  paddingBottom: SizeConfig.defaultSize! * Dimens.sizePoint5,
                                ),
                              ),


                              Padding(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.defaultSize! *
                                        Dimens.sizePoint5),
                                child: BorderRoundedContainer(
                                  buttonText:
                                      CustomObject.weightLift,
                                  buttonRadius:
                                      SizeConfig.defaultSize! * Dimens.size10,
                                  buttonColor: ConstantColors.primaryColor,
                                  borderColor: ConstantColors.primaryColor,
                                  buttonTextColor: ConstantColors.textWhiteColor,
                                  paddingLeft: SizeConfig.defaultSize! * Dimens.size1,
                                  paddingRight: SizeConfig.defaultSize! * Dimens.size1,
                                  paddingTop: SizeConfig.defaultSize! * Dimens.sizePoint5,
                                  paddingBottom: SizeConfig.defaultSize! * Dimens.sizePoint5,
                                ),
                              ),
                            ]),
                          ),

                          ///-------------------- Registration Period container ---------------------
                          DetailContainer(
                            title: "Full Description",
                            description: CustomObject.fullDetail,
                            readMoreButtonVisibility: false,
                            tabSelectionValue: 1,
                          ),

                        ],
                      ),
                    ]),
              ),
            ),

            ///-------------------- Join Now button ---------------------
            Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.defaultSize! * Dimens.size1,
                    top: SizeConfig.defaultSize! * Dimens.size1),
                child:RoundedButton(
                    buttonText: "Related Doctor's ",
                    buttonTextColor: Colors.white,
                    buttonRadius: SizeConfig.defaultSize! * Dimens.size29,
                    buttonColor: ConstantColors.secondaryColor,
                    paddingLeft: SizeConfig.defaultSize! * Dimens.size2Point5,
                    paddingRight:
                    SizeConfig.defaultSize! * Dimens.size2Point5,
                    textPaddingAll:
                    SizeConfig.defaultSize! * Dimens.size1Point5,
                    press: (BuildContext context) => {openDialog()}) ),
          ]);
  }


  void openDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RelatedDoctorsDialogBox();
        });
  }

  Future<void> share(BuildContext context) async {
    await Share.share(ConstantStrings.appUrl+ "  "+"\n\n" + "Hello this is gamein.games app refer code:",
        subject: "Your Refer Code: ");
  }
}
