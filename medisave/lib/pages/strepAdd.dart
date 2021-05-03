import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/button_tipo.dart';
import 'package:medisave/pages/programar_dh.dart';
import 'package:medisave/widgets/date_picker.dart';
import 'package:medisave/widgets/time_picker.dart';

import 'intervalo_horas.dart';

class Addalarma extends StatefulWidget {
  Addalarma({Key key}) : super(key: key);

  @override
  _AddalarmaState createState() => _AddalarmaState();
}

class _AddalarmaState extends State<Addalarma> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Agregar Alarma'),
      ),
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep < this._mySteps().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              //Logic to check if everything is completed
              print('Completed, check fields.');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
        
       ),    
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          isActive: _currentStep >= 0,
          title: Text('Medicamento'),
          content: Column(
            children: [
              SizedBox(height: 50),
              TextFormField(
                  decoration: InputDecoration(
                labelText: 'Nombre del medicamento',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              )),
              SizedBox(height: 30),
              MiBoton(),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Cantidad por toma',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 30),
            ],
          )),
      Step(
          isActive: _currentStep >= 1,
          title: Text('Recordatorio'),
          content: Column(
            children: [
              SizedBox(height: 30),
              IntervaloHoras(),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Duración',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mensaje',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 80),
            ],
          )),
      Step(
        title: Text('Programar'),
        content: Column(
          children: [
            DatePickerWidget(),
            TimePickerWidget(),
                 ],
        ),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}
