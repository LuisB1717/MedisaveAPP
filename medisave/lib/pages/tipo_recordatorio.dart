import 'package:flutter/material.dart';

class TipoRecordatorio extends StatefulWidget {
  TipoRecordatorio({Key key}) : super(key: key);

  @override
  _TipoRecordatorioState createState() => _TipoRecordatorioState();
}

String value;
List tiporecordatorio = ['tipo1', 'tipo2'];

class _TipoRecordatorioState extends State<TipoRecordatorio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: DropdownButton(
          hint: Text('Seleccione Tipo de Recordatorio'),
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
          },
          items: tiporecordatorio
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList()),
    );
  }
}
