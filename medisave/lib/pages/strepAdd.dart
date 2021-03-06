import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/models/services_firestore.dart';
import 'package:medisave/models/alarma.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Addalarma extends StatefulWidget {
  Addalarma({Key key}) : super(key: key);

  @override
  _AddalarmaState createState() => _AddalarmaState();
}

class _AddalarmaState extends State<Addalarma> {
  final nombrem = TextEditingController();
  final tipo = TextEditingController();
  final cantidad = TextEditingController();
  final duracion = TextEditingController();
  final mensaje = TextEditingController();
  final fecha = TextEditingController();
  final hora = TextEditingController();
  bool estado = true;
  DropdownSearch tipoc;
  TimeOfDay rawHora;
  String medicamentoSeleccionado = "Pastilla";
  String intervalo = "4";
  List tipomedicamento = ["Pastilla", "Inyección", "Jarabe", "Gotas", "Otro"];
  int current_step = 0;
  void dispose() {
    nombrem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
          isActive: true,
          title: Text('Medicamento'),
          content: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                  controller: nombrem,
                  decoration: InputDecoration(
                    labelText: 'Nombre del medicamento',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  )),
              //slae error al iniciar dameun toque,
              SizedBox(height: 20),
              DropdownSearch<String>(
                searchBoxController: tipo,
                validator: (value) => medicamentoSeleccionado,
                mode: Mode.MENU,
                showSelectedItem: true,
                label: "Tipo Medicamento",
                items: ["Pastilla", "Inyección", "Jarabe", "Gotas", "Otro"],
                selectedItem: "Pastilla",
                onChanged: (newValue) {
                  setState(() {
                    medicamentoSeleccionado = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: cantidad,
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
              DropdownSearch<String>(
                searchBoxController: tipo,
                validator: (value) => intervalo,
                mode: Mode.MENU,
                showSelectedItem: true,
                label: "Frecuencia de la toma en horas",
                items: ["4", "6", "8", "12", "20", "24"],
                selectedItem: "4",
                onChanged: (newValue) {
                  setState(() {
                    intervalo = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: mensaje,
                decoration: InputDecoration(
                  labelText: 'Mensaje',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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
            TextFormField(
              readOnly: true,
              controller: fecha,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  labelText: 'Seleccionar Fecha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (date != null) {
                  fecha.text = date.toString().substring(0, 10);
                } else
                  return;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: hora,
              decoration: InputDecoration(
                  icon: Icon(Icons.timer_rounded),
                  labelText: 'Seleccionar Hora de inicio',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onTap: () async {
                var time = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                if (time == null) {
                  return;
                } else {
                  hora.text = time.format(context);
                  rawHora = time;
                }
              },
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Alarma'),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Stepper(
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
                      if (current_step == 2) {
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.BACKGROUND,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12.3),
                          ),
                          onPressed: () => {},
                          label: Text(
                            "Guardar",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          icon: Icon(Icons.save),
                        );
                      }
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
                      )),
                    ],
                  );
                },
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.BACKGROUND,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                onPressed: () async {
                  final now = DateTime.now();
                  final ida = await FirestoreService.getalarmid();
                  await FirestoreService.setAlarma(Alarma(
                    'id',
                    ida,
                    nombrem.text,
                    medicamentoSeleccionado,
                    int.parse(cantidad.text),
                    int.parse(intervalo),
                    mensaje.text,
                    true,
                    DateTime.parse(fecha.text),
                    DateTime(now.year, now.month, now.day, rawHora.hour,
                        rawHora.minute),
                  ));
                  // donde va?  a ver prueba oe pero arriba esta valuechoose ya le cambie el nombre revisa otra vez
                  //conforme notarioa ver pera
                  Navigator.pop(context);
                },
                label: Text(
                  "Guardar",
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
                icon: Icon(Icons.save),
              ),
            ],
          ),
        ),
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
