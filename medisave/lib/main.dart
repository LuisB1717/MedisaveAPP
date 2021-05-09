import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/home_2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final int helloAlarmID = 0;
  await Firebase.initializeApp();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
  await AndroidAlarmManager.periodic(
      const Duration(seconds: 5), helloAlarmID, printHello);
}

class MyApp extends StatelessWidget {
  static final String title = 'Medisave';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: AppColors.BACKGROUND),
        home: HomePage(),
      );
}
