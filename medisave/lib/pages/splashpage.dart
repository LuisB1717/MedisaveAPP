import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class SplashPage extends StatelessWidget {
  final int duration = 0;
  Widget goToPage;

  SplashPage({this.goToPage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Image(image: AssetImage('assets/imgs/perfil.jpg'))),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(padding: EdgeInsets.only(top: 20.0)),
            ]),
      ),
    );
  }
}
