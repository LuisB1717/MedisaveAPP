import 'package:flutter/material.dart';

class MiBoton extends StatefulWidget {
  MiBoton({Key key}) : super(key: key);

  @override
  _MiBotonState createState() => _MiBotonState();
}

class _MiBotonState extends State<MiBoton> {
  String valueChoose;
  List tipomedicamento = ['Pastilla', 'Inyección', 'Jarabe', 'Otro'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: DropdownButton(
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
            });
          },
          items: tipomedicamento
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList()),
    );
  }
}
