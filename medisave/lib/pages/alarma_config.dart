import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/add_recordatorio.dart';
import 'package:medisave/pages/homepage.dart';
import 'button_tipo.dart';

class AlarmaConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Alarma'), backgroundColor: AppColors.BACKGROUND),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(children: [
      
              SizedBox(height: 15),
              MiBoton(),
              
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mensaje',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.BACKGROUND,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12.3),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePageLogin())),
                },
                label: Text(
                  "Guardar",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                icon: Icon(Icons.save_rounded),
              )
            ]),
          ),
        ));
  }
}