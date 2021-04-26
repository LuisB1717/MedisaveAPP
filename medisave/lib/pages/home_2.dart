import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medisave/Services/auth_2.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/homepage.dart';
import 'package:medisave/widgets/background_painter.dart';
import 'package:medisave/widgets/logged_in_widget.dart';
import 'package:medisave/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading(context);
              } else if (snapshot.hasData) {
                return HomePageLogin();
                //LoggedInWidget();
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading(BuildContext context) {
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
        Center(child: CircularProgressIndicator()),
      ],
      /*
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(),
        ],*/
    );
  }

  /*=> Stack( 
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );*/
}
