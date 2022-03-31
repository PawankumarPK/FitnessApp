import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitness_app/res/ConstantColors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'login/LoginScaffold.dart';

/*Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /*await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );*/
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamein.games',
      theme: ThemeData(
          primaryColor: ConstantColors.primaryColor,
          secondaryHeaderColor: ConstantColors.secondaryColor,
          scaffoldBackgroundColor: ConstantColors.screenBackgroundColor),

      home: LoginScaffold()),

  );
}

