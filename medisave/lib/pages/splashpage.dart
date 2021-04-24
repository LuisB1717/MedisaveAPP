import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({this.goToPage, this.duration});

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
                child: Image.asset('assets/imgs/perfil.ico'),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(padding: EdgeInsets.only(top: 20.0)),
            ]),
      ),
    );
  }
}
