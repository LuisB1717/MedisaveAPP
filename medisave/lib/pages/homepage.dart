import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/widgets/logged_in_widget.dart';

import 'Add_ medicine.dart';

class HomePageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xff158dad), title: Text('Medisave')),
      drawer: LoggedInWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff158dad),
        onPressed: () {
          //print("Add");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Addmedicine()));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 5,
        highlightElevation: 10,
      ),
    );
  }
}
