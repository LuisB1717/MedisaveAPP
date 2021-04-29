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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        child: DropdownButton(
            hint: Text("Tipo de Alarma"),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.4,
            ),
            underline: SizedBox(),
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
      ),
    );
  }
}
