import 'package:fitness_app/otpVerification/screen/OtpVerificationScreen.dart';
import 'package:flutter/material.dart';

class OtpVerificationScaffold extends StatelessWidget {
  const OtpVerificationScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpVerificationScreen(),
    );
  }
}
