import 'package:flutter/material.dart';

import 'package:medisave/pages/splashpage.dart';
import 'package:medisave/pages/Welcome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      goToPage: Welcome(),
    ),
  ));
}
