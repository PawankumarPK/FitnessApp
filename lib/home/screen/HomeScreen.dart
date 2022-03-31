import 'dart:async';
import 'package:async/async.dart';
import 'package:fitness_app/res/ConstantColors.dart';
import 'package:fitness_app/utils/customObject/CustomObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/Dimens.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/customObject/FlutterToast.dart';
import '../../utils/model/WeightAbove80.dart';
import '../../utils/model/WeightBelow50.dart';
import '../../utils/model/WeightBelow80.dart';
import '../widget/SelectCardWebWidget.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var flutterToast = FlutterToast();

  @override
  void initState() {
    super.initState();
    chat(context);
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColors.screenBackgroundColor,
      child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.defaultSize! * Dimens.size2,
              bottom: SizeConfig.defaultSize! * Dimens.size2,
              left: SizeConfig.defaultSize! * Dimens.size2,
              right: SizeConfig.defaultSize! * Dimens.size2),
          child: getBody()),
    );
  }

  Widget getBody() {
    return checkListWithBMI();
  }

  Widget checkListWithBMI() {
    if (CustomObject.bmi <= 30) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: below50.length,
          itemBuilder: (BuildContext ctx, int index) {
            var bodyType = below50[index];
            return SelectCardWebWidget(
              id: bodyType.id,
              imgString: bodyType.image,
              exerciseName: bodyType.exerciseName,
              caloriesBurn: bodyType.caloriesBurn,
              sets: bodyType.sets,
              reps: bodyType.reps,
              weightLift: bodyType.weightLift,
              fullDetails: bodyType.fullDetails,
            );
          });
    } else if (CustomObject.bmi >= 31 && CustomObject.bmi <= 80) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: below80.length,
          itemBuilder: (BuildContext ctx, int index) {
            var bodyType = below80[index];
            return SelectCardWebWidget(
              id: bodyType.id,
              imgString: bodyType.image,
              exerciseName: bodyType.exerciseName,
              caloriesBurn: bodyType.caloriesBurn,
              sets: bodyType.sets,
              reps: bodyType.reps,
              weightLift: bodyType.weightLift,
              fullDetails: bodyType.fullDetails,
            );
          });
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: above80.length,
        itemBuilder: (BuildContext ctx, int index) {
          var bodyType = above80[index];
          return SelectCardWebWidget(
            id: bodyType.id,
            imgString: bodyType.image,
            exerciseName: bodyType.exerciseName,
            caloriesBurn: bodyType.caloriesBurn,
            sets: bodyType.sets,
            reps: bodyType.reps,
            weightLift: bodyType.weightLift,
            fullDetails: bodyType.fullDetails,
          );
        });
  }

  @override
  bool get wantKeepAlive => true;

  void chat(BuildContext context) {
    dynamic conversationObject = {
      'appId': '106378000d07a4f1cfe2d55138ca1c912',
      // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print("Conversation builder success : " + conversationObject..toString());
      var events = {
        'Sending message to server': (resp) {
        }
      };
      print("------>>>  " + events.values.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });
  }



  void getData()async{
    DocumentSnapshot variable = await FirebaseFirestore.instance.collection("users").doc(CustomObject.firestoreDocId).get();
  }
}
