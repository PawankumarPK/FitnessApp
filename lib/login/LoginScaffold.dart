import 'package:fitness_app/login/screen/LoginScreen.dart';
import 'package:flutter/material.dart';

import '../utils/SizeConfig.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
