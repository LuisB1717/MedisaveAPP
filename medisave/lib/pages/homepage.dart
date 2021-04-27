import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/widgets/logged_in_widget.dart';

class HomePageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BACKGROUND,
        title: Text('Medisave'),
      ),
      drawer: LoggedInWidget(),
    );
  }
}
