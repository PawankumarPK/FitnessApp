import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:fitness_app/home/HomeScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commonWidgets/button/RoundedButton.dart';
import '../../commonWidgets/textField/RoundedInputField.dart';
import '../../otpVerification/OtpVerificationScaffold.dart';
import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/ConstantStrings.dart';
import '../../res/Dimens.dart';
import '../../res/ImageAssets.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';
import '../../utils/customObject/FlutterToast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNoController = new TextEditingController();

  var flutterToast = new FlutterToast();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text('Tap back again to leave'),
      ),
      child: Container(
        width: double.infinity,
        color: ConstantColors.screenBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///------------------------- Fit Be text ------------------------------
            Text(
              "iFit",
              style: TextStyle(
                  color: ConstantColors.textBlackColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size8,
                  fontFamily: ConstantFonts.poppinsBold),
            ),

            ///------------------------- Please sign in to continue ------------------------------
            Padding(
              padding:
                  EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size5),
              child: Text(
                ConstantStrings.pleaseSignInToContinue,
                style: TextStyle(
                    color: ConstantColors.textBlackColor,
                    fontSize: SizeConfig.defaultSize! * Dimens.size2,
                    fontFamily: ConstantFonts.poppinsRegular),
              ),
            ),

            ///------------------------- Text Input Field ------------------------------
            Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.defaultSize! * Dimens.size3,
                    right: SizeConfig.defaultSize! * Dimens.size3,
                    top: SizeConfig.defaultSize! * Dimens.size3),
                child: RoundedInputField(
                  maxLength: 10,
                  textInputType: TextInputType.number,
                  icon: ImageAssets.smartPhone,
                  hintText: ConstantStrings.enterMobileNo,
                  controller: mobileNoController,
                  onChanged: (value) {},
                )),

            ///-------------------------- Submit Button ------------------------------
            RoundedButton(
                buttonText: ConstantStrings.submit,
                buttonTextColor: Colors.white,
                buttonRadius: SizeConfig.defaultSize! * Dimens.size29,
                buttonColor: ConstantColors.secondaryColor,
                paddingLeft: SizeConfig.defaultSize! * Dimens.size2Point5,
                paddingRight: SizeConfig.defaultSize! * Dimens.size2Point5,
                textPaddingAll: SizeConfig.defaultSize! * Dimens.size1Point5,
                press: (BuildContext context) => sendOtp(context)),
          ],
        ),
      ),
    );
  }

  void sendOtp(BuildContext context) {
    if (mobileNoController.text.isEmpty) {
      flutterToast.toast("Field Can\'t Be Empty");
      return;
    }
    if (mobileNoController.text.length < 10) {
      flutterToast.toast(ConstantStrings.pleaseEnterValidNumber);
      return;
    }

    CustomObject.storedMobileNumber = mobileNoController.text;

    addUser(context);

    print("========>>>>  " + CustomObject.firestoreDocId);
  }

  Future<void> addUser(BuildContext context) {
    return users
        .add({
          'Name': "User",
          'ContactNo': CustomObject.storedMobileNumber,
          'Email': "",
          'Height': "",
          'Weight': "",
          'Gender': 1,
        })
        .then((value) => {
              CustomObject.firestoreDocId = value.id,
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OtpVerificationScaffold())),
            })
        .catchError((error) => print("Failed to add user: $error"));
  }
}
