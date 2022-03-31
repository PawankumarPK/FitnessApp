import 'package:fitness_app/home/screen/HomeScreen.dart';
import 'package:fitness_app/otpVerification/screen/OtpVerificationScreen.dart';
import 'package:fitness_app/profile/ProfileScaffold.dart';
import 'package:flutter/material.dart';

import '../res/ConstantColors.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.secondaryColor,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fitness App'),
              InkWell(
                  onTap: () =>
                  {
                    goToProfile(context)
                  },


                  child: Icon(Icons.person)
              )
            ]
        ),
        automaticallyImplyLeading: false,
      ),
      body: HomeScreen(),
    );
  }

  void goToProfile(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfileScaffold()));
  }
}
