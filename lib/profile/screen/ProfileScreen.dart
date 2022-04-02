import 'package:fitness_app/home/HomeScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../commonWidgets/progressIndicator/CustomProgressIndicator.dart';
import '../../commonWidgets/button/RoundedButton.dart';
import '../../commonWidgets/textField/RoundedInputField.dart';
import '../../res/ConstantColors.dart';
import '../../res/ConstantFonts.dart';
import '../../res/ConstantStrings.dart';
import '../../res/Dimens.dart';
import '../../res/ImageAssets.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/CustomObject.dart';
import '../../utils/customObject/FlutterToast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController enterWeightController = TextEditingController();
  TextEditingController enterHeightController = TextEditingController();

  String dropdownValue = "";
  var genderValue;

  var flutterToast = new FlutterToast();
  bool isLoading = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  List<String> spinnerItems = [
    'Female',
    'Male',
  ];

  Pattern pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getData();



  }

  @override
  void dispose() {
    nameController.dispose();
    contactNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Stack(children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///------------------------- Name ---------------------------
                    Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.defaultSize! * Dimens.size3,
                            right: SizeConfig.defaultSize! * Dimens.size3,
                            top: SizeConfig.defaultSize! * Dimens.size3),
                        child: RoundedInputField(
                          textInputType: TextInputType.text,
                          icon: ImageAssets.person,
                          hintText: nameController.text == ""
                              ? "Name"
                              : nameController.text,
                          controller: nameController,
                          onChanged: (value) {},
                        )),

                    ///--------------------- Mobile number ----------------------
                    Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * Dimens.size3,
                          right: SizeConfig.defaultSize! * Dimens.size3,
                        ),
                        child: RoundedInputField(
                          textInputType: TextInputType.number,
                          maxLength: 10,
                          icon: ImageAssets.smartPhone,
                          hintText: contactNumberController.text == ""
                              ? "Contact No"
                              : contactNumberController.text,
                          controller: contactNumberController,
                          onChanged: (value) {},
                        )),

                    ///----------------------- Email Address -----------------------
                    Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * Dimens.size3,
                          right: SizeConfig.defaultSize! * Dimens.size3,
                        ),
                        child: RoundedInputField(
                          textInputType: TextInputType.emailAddress,
                          icon: ImageAssets.smartPhone,
                          hintText: emailController.text == ""
                              ? "Email"
                              : emailController.text,
                          controller: emailController,
                          onChanged: (value) {},
                        )),

                    ///--------------------- Height ----------------------
                    Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * Dimens.size3,
                          right: SizeConfig.defaultSize! * Dimens.size3,
                        ),
                        child: RoundedInputField(
                          textInputType: TextInputType.number,
                          maxLength: 10,
                          icon: ImageAssets.smartPhone,
                          hintText: enterHeightController.text == ""
                              ? "Enter Height in feet"
                              : enterHeightController.text,
                          controller: enterHeightController,
                          onChanged: (value) {},
                        )),

                    ///--------------------- Weight ----------------------
                    Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * Dimens.size3,
                          right: SizeConfig.defaultSize! * Dimens.size3,
                        ),
                        child: RoundedInputField(
                          textInputType: TextInputType.number,
                          maxLength: 10,
                          icon: ImageAssets.smartPhone,
                          hintText: enterWeightController.text == ""
                              ? "Enter Weight in kg"
                              : enterWeightController.text,
                          controller: enterWeightController,
                          onChanged: (value) {},
                        )),

                    SizedBox(
                      height: SizeConfig.defaultSize! * Dimens.size12,
                    )
                  ]),
            ),

            ///--------------- Update profile button ---------------------
            Positioned(
              bottom: 1,
              left: 1,
              right: 1,
              child: Container(
                color: ConstantColors.screenBackgroundColor,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: RoundedButton(
                      buttonText: ConstantStrings.updateProfile,
                      buttonTextColor: Colors.white,
                      buttonRadius: SizeConfig.defaultSize! * Dimens.size29,
                      buttonColor: ConstantColors.secondaryColor,
                      paddingLeft: SizeConfig.defaultSize! * Dimens.size2Point5,
                      paddingRight:
                          SizeConfig.defaultSize! * Dimens.size2Point5,
                      textPaddingAll:
                          SizeConfig.defaultSize! * Dimens.size1Point5,
                      press: (BuildContext context) => {updateData()}),
                ),
              ),
            ),
          ]);
  }

  void postEditProfileData(BuildContext context) {
    RegExp regex = new RegExp(pattern.toString());

    if (contactNumberController.text != "") {
      if (contactNumberController.text.length < 10) {
        flutterToast.toast(ConstantStrings.pleaseEnterValidNumber);
        return;
      }
    }

    if (emailController.text != "") {
      if (!regex.hasMatch(emailController.text.toString()))
        return flutterToast.toast("Please check email");
    }
    if (nameController.text.isEmpty) {
      flutterToast.toast("Name can\'t be empty");
      return;
    }

    if (genderValue == null) {
      genderValue = 1;
    }
  }

  Future<void> addUser(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'Name': "Pawan Yadav", // John Doe
          'ContactNo': 9910765616, // Stokes and Sons
          'Email': "pawan@gmail,com",
          'Height': "Pawan Yadav", // John Doe
          'Weight': "Pawan Yadav", // John Doe
          'Gender': 1, // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void getData() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection("users")
        .doc(CustomObject.firestoreDocId)
        .get();
    nameController.text = variable['Name'];
    contactNumberController.text = variable['ContactNo'];
    emailController.text = variable['Email'];
    enterWeightController.text = variable['Weight'];
    enterHeightController.text = variable['Height'];

    setState(() {
      isLoading = false;
    });
    //gender = variable['Gender'];
  }

  void updateData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(CustomObject.firestoreDocId)
        .update({
      'Name': nameController.text,
      "ContactNo": contactNumberController.text,
      "Email": emailController.text,
      "Gender": "999999999",
      "Height": enterHeightController.text,
      "Weight": enterWeightController.text,
    });

    flutterToast.toast("Profile Updated Successfully");

    CustomObject.bmi = int.parse(enterWeightController.text);
    print("=======<><><><>  " +  CustomObject.bmi.toString());

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScaffold()));
    //calculateBMI();
  }

  void calculateBMI() {
    var convertHeightIntoCm = int.parse(enterHeightController.text.toString()) *
        int.parse(30.toString());
    var calculateBMI = (int.parse(enterWeightController.text.toString()) /
            convertHeightIntoCm /
            convertHeightIntoCm) *
        10000;

    CustomObject.bmi = calculateBMI.toInt();

    print("-------->>>>>>  "+ CustomObject.bmi.toString());

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScaffold()));
  }


}
