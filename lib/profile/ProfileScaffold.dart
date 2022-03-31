import 'package:fitness_app/profile/screen/ProfileScreen.dart';
import 'package:flutter/material.dart';

import '../res/ConstantColors.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
        backgroundColor: ConstantColors.secondaryColor,
      ),
      body: ProfileScreen(),
    );
  }
}
