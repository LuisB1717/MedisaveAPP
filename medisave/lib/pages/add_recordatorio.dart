import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/tipo_recordatorio.dart';
import 'package:medisave/widgets/date_picker.dart';
import 'package:medisave/widgets/time_picker.dart';

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
              style: TextStyle(fontSize: 15, color: AppColors.BACKGROUND),
              decoration: InputDecoration(
                labelText:
                    'Intervalo de Horas para la Administración de Medicamentos',
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
            SizedBox(height: 15),
            DatePickerWidget(),
            SizedBox(height: 15),
            TimePickerWidget(),
            SizedBox(height: 80),
            ElevatedButton.icon(
                icon: Icon(
                  Icons.arrow_right_rounded,
                  color: AppColors.BACKGROUND,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                onPressed: () {},
                label: Text(
                  "Continuar",
                  style: TextStyle(fontSize: 18.0, color: AppColors.BACKGROUND),
                ))
          ]),
        ));
  }
}
