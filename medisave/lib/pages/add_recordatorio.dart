import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class Addreminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Agregar Recordatorio'),
        backgroundColor: AppColors.BACKGROUND,
      ),
      body: Center(
        child: Text("Recordatorio"),
      ),
    );
  }
}
