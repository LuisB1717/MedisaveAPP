import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/tipo_recordatorio.dart';

class Addreminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Recordatorio'),
          backgroundColor: AppColors.BACKGROUND,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(children: [
            /*onSaved: (value) {
                        nameValue=value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Llene este campo";
                        }*/
            SizedBox(height: 15),
            TipoRecordatorio(),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Rango de Horas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                labelText: '¿Cuántos días?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Continuar",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ))
          ]),
        ));
  }
}
