import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/home_2.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
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
