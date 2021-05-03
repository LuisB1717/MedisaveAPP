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
  int current_step = 0;

  List<Step> steps = [
    Step(
        isActive: true,
        title: Text('Medicamento'),
        content: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
                decoration: InputDecoration(
              labelText: 'Nombre del medicamento',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            )),
            SizedBox(height: 20),
            MiBoton(),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Cantidad por toma',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        )),
    Step(
        isActive: true,
        title: Text('Recordatorio'),
        content: Column(
          children: [
            SizedBox(height: 10),
            IntervaloHoras(),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duración',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mensaje',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        )),
    Step(
      isActive: true,
      title: Text('Programar'),
      content: Column(
        children: [
          SizedBox(height: 10),
          DatePickerWidget(),
          SizedBox(height: 20),
          TimePickerWidget(),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Alarma'),
      ),
      body: SizedBox(
        child: Container(
            child: Stepper(
                currentStep: this.current_step,
                steps: steps,
                type: StepperType.vertical,
                onStepTapped: (step) {
                  setState(() {
                    current_step = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (current_step < steps.length - 1) {
                      current_step = current_step + 1;
                    } else {
                      current_step = 0;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (current_step > 0) {
                      current_step = current_step - 1;
                    } else {
                      current_step = 0;
                    }
                  });
                },
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Container(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.BACKGROUND,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: onStepContinue,
                          label: Text(
                            "Continuar",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          icon: Icon(Icons.navigate_next),
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.BACKGROUND,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: onStepCancel,
                          label: Text(
                            "Cancelar",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          icon: Icon(Icons.cancel_outlined),
                        ),
                      ))
                    ],
                  );
                })),
      ),
    );
  }
}

//       body: Stepper(
//         steps: _mySteps(),
//         currentStep: this._currentStep,
//         onStepTapped: (step) {
//           setState(() {
//             this._currentStep = step;
//           });
//         },
//         onStepContinue: () {
//           setState(() {
//             if (this._currentStep < this._mySteps().length - 1) {
//               this._currentStep = this._currentStep + 1;
//             } else {
//               //Logic to check if everything is completed
//               print('Completed, check fields.');
//             }
//           });
//         },
//         onStepCancel: () {
//           setState(() {
//             if (this._currentStep > 0) {
//               this._currentStep = this._currentStep - 1;
//             } else {
//               this._currentStep = 0;
//             }
//           });
//         },

//        ),
//     );
//   }

//   List<Step> _mySteps() {
//     List<Step> _steps = [
//       Step(
//           isActive: _currentStep >= 0,
//           title: Text('Medicamento'),
//           content: Column(
//             children: [
//               SizedBox(height: 50),
//               TextFormField(
//                   decoration: InputDecoration(
//                 labelText: 'Nombre del medicamento',
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//               )),
//               SizedBox(height: 30),
//               MiBoton(),
//               SizedBox(height: 30),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Cantidad por toma',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//               ),
//               SizedBox(height: 30),
//             ],
//           )),
//       Step(
//           isActive: _currentStep >= 1,
//           title: Text('Recordatorio'),
//           content: Column(
//             children: [
//               SizedBox(height: 30),
//               IntervaloHoras(),
//               SizedBox(height: 15),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Duración',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Mensaje',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ),
//               SizedBox(height: 80),
//             ],
//           )),
//       Step(
//         title: Text('Programar'),
//         content: Column(
//           children: [
//             DatePickerWidget(),
//             TimePickerWidget(),
//                  ],
//         ),
//         isActive: _currentStep >= 2,
//       )
//     ];
//     return _steps;
//   }
// }
