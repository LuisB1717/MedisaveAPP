import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/add_recordatorio.dart';
import 'button_tipo.dart';

class Addmedicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Añadir Medicamento'),
            backgroundColor: AppColors.BACKGROUND),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(children: [
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre del medicamento',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 15),
              MiBoton(),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Cantidad por toma',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 90),
              SizedBox(height: 50),
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
                          builder: (BuildContext context) => Addreminder())),
                },
                label: Text(
                  "Siguiente",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                icon: Icon(Icons.next_week_rounded),
              )
            ]),
          ),
        ));
  }
}

// ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//       primary: AppColors.BACKGROUND,
//     ),
//     child: Text(
//       "Continuar",
//       style: TextStyle(fontSize: 18.0, color: Colors.white),
//     )),
// SizedBox(height: 15),
//  /*onSaved: (value) {
//   nameValue=value;
// },
// validator: (value) {
//   if (value.isEmpty) {
//     return "Llene este campo";
//   }*/
