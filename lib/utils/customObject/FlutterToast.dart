import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../res/ConstantColors.dart';

class FlutterToast{

  void toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ConstantColors.darkBlueColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}