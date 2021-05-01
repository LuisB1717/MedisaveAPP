import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/widgets/google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*=> Stack(
    fit: StackFit.expand,*/
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.BACKGROUND, AppColors.BACKGROUND],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(100))),
          child: Center(
            child: Image.asset('assets/imgs/mvlog.png'),
          ),
        ),
        buildSignUp(),
      ],
      /*
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(),
        ],*/
    );
  }

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              /*child: Text(
                'MEDISAVE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
            ),
          ),
          Spacer(),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Inicia Sesión para Continuar',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      );
}
