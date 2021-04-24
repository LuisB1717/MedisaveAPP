import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/widgets/themebutton.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*LoginService loginService = Provider.of<LoginService>(context, listen: false);*/

    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 180,
                            height: 180,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Image.asset('assets/imgs/logmsv.ico',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text('Bienvenidoa MEDISAVE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 40),
                      Text('Tómate el tiempo para cuidar tu salud.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 50),
                      userTextField(),
                      SizedBox(height: 50),
                      passwordTextField(),
                      SizedBox(height: 50),
                      ThemeButton(
                        label: 'Tratar Ahora!',
                        highlight: Colors.green[900],
                        color: AppColors.SPICES,
                        onClick: () {
                          /*Navigator.of(context).pushNamed('/categorylistpage');*/
                        },
                      ),
                      /*
                      ThemeButton(
                        label: 'Hacer Onboarding',
                        highlight: Colors.green[900],
                        color: AppColors.DARK_GREEN,
                        onClick: () {
                          /*Navigator.of(context).pushNamed('/onboardingpage');*/
                        },
                      ),*/
                      ThemeButton(
                          label: "Hacer Login",
                          labelColor: AppColors.MAIN_COLOR,
                          color: Colors.transparent,
                          highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                          borderColor: AppColors.MAIN_COLOR,
                          borderWidth: 4,
                          onClick: () async {
                            /*bool success = await loginService.signInWithGoogle();

                      if (success) {
                        Navigator.of(context).pushNamed('/categorylistpage');
                      }*/
                          })
                    ],
                  ),
                )
              ],
            )));
  }

  Widget userTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15),
                prefixIcon: Icon(Icons.email, color: Color(0xff158dad)),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }

  Widget passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Contraseña',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xff158dad)),
                hintText: 'Contraseña',
                hintStyle: TextStyle(
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }
}
