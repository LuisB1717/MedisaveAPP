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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(children: [
              /*onSaved: (value) {
                          nameValue=value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Llene este campo";
                          }*/
              SizedBox(height: 30),
              TipoRecordatorio(),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText:
                      'Intervalo de Horas para la Administración de Medicamentos',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '¿Cuántos días va a durar la alarma?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 15),
              DatePickerWidget(),
              SizedBox(height: 15),
              TimePickerWidget(),
              SizedBox(height: 80),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.BACKGROUND,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12.3),
                ),
                onPressed: () => {},
                label: Text(
                  "Continuar",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                icon: Icon(Icons.next_week_rounded),
              )
            ]),
          ),
        ));
  }
}
