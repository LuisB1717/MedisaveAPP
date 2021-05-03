import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'add_recordatorio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medisave/models/services_firestore.dart';
import 'button_tipo.dart';

class Addmedicine extends StatefulWidget {
  Addmedicine({Key key}) : super(key: key);
  @override
  _AddmedicineState createState() => _AddmedicineState();
}

class _AddmedicineState extends State<Addmedicine> {
  final _keyform = GlobalKey<FormState>();
  final nombrem = TextEditingController();

  void dispose() {
    nombrem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Añadir Medicamento'),
            backgroundColor: AppColors.BACKGROUND),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Form(
              key: _keyform,
              child: Column(children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: nombrem,
                  validator: (valor) {
                    if (valor.isEmpty) {
                      return 'Nombre del medicamento vacio';
                    }
                    if (valor.length < 1) {
                      return 'Nombre de medicamento no valido';
                    }
                    return null;
                  },
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
                  keyboardType: TextInputType.number,
                  validator: (valor) {
                    if (valor.isEmpty) {
                      return 'Ingrese cantidad por toma';
                    }
                    return null;
                  },
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 12.3),
                  ),
                  onPressed: () => {
                    if (_keyform.currentState.validate())
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Addreminder())),

                        // FirestoreService.setAlarma(Alarma('sadas','sda','asdas',2,2,3,'das',DateTime()))
                        // print(nombrem.text),
                      }
                    else
                      {
                        print("Ha ocurrido un error, revise formulario"),
                      },
                  },
                  label: Text(
                    "Siguiente",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  icon: Icon(Icons.next_week_rounded),
                )
              ]),
            ),
          ),
        ));
  }
}
