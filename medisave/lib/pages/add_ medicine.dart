import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'boton.dart';

class Addmedicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Medicamento'), backgroundColor: AppColors.BACKGROUND),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(children: [
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              /*onSaved: (value) {
                        nameValue=value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Llene este campo";
                        }*/
            ),
            SizedBox(height: 15),
            MiBoton(),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Dosis',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppColors.BACKGROUND,
                ),
                child: Text(
                  "Continuar",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ))
          ]),
        ));
  }
}
