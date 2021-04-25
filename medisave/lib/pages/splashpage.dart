import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/imgs/perfil.jpg',
        key: const Key('splash_bloc_image'),
        width: 150,
      )),
    );
  }
}
