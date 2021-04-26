import 'package:flutter/material.dart';
import 'package:medisave/widgets/logged_in_widget.dart';

class HomePageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: LoggedInWidget(),
    );
  }
}
