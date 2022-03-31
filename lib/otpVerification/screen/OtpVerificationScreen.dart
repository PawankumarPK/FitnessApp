import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../commonWidgets/button/RoundedButton.dart';
import '../../home/HomeScaffold.dart';
import '../../home/screen/HomeScreen.dart';
import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/ConstantStrings.dart';
import '../../res/Dimens.dart';
import '../../res/ImageAssets.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';
import '../../utils/customObject/FlutterToast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController otpController = new TextEditingController();

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  var flutterToast = new FlutterToast();
  late String _verificationCode;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();


  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: ConstantColors.navyBlueColor,
    borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size1),
    border: Border.all(
      color: ConstantColors.secondaryColor,
    ),
  );

  String countryCode = "+91"; // give your

  @override
  void initState() {
    super.initState();
    verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      color: ConstantColors.screenBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///------------------------- OTP verification ------------------------------
          Padding(
            padding:
                EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size1),
            child: Text(
              ConstantStrings.otpVerification,
              style: TextStyle(
                  color: ConstantColors.darkGreyColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size4,
                  fontFamily: ConstantFonts.poppinsSemiBold),
            ),
          ),

          ///--------------------------- Verification code boxes ui --------------------
          Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size3),
            child: PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(
                  fontSize: SizeConfig.defaultSize! * Dimens.size2Point5,
                  color: Colors.white),
              eachFieldWidth: SizeConfig.defaultSize! * Dimens.size4,
              eachFieldHeight: SizeConfig.defaultSize! * Dimens.size5Point5,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScaffold()));
                      // route.register(context, CustomObject.storedMobileNumber);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState!
                      .showSnackBar(SnackBar(content: Text('Invalid OTP')));
                }
              },
            ),
          ),

          ///------------------------- Circular progress bar ------------------------------

          Center(
              child: CircularProgressIndicator(
            valueColor:
                new AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
          )),

          ///------------------------- Otp Not Delivered ------------------------------
          Padding(
            padding:
                EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size7),
            child: Text(
              ConstantStrings.otpNotDelivered,
              style: TextStyle(
                  color: ConstantColors.textBlackColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size2,
                  fontFamily: ConstantFonts.poppinsRegular),
            ),
          ),

          ///------------------------- Resend ------------------------------
          Padding(
            padding:
                EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size2),
            child: InkWell(
              onTap: () {
                resendOtp();
                //resendOtp();
              },
              child: Text(
                ConstantStrings.resend,
                style: TextStyle(
                    color: ConstantColors.darkBlueColor,
                    fontSize: SizeConfig.defaultSize! * Dimens.size2,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///--------------------------- Function of Resend OTP -----------------------------------
  void resendOtp() {
    verifyPhone();
    flutterToast.toast("OTP Resend Successfully");
    //route.register(context, CustomObject.storedMobileNumber);
  }

  ///-------------------------- Otp verification function ----------------------------
  verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '$countryCode${CustomObject.storedMobileNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {}
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }


}
