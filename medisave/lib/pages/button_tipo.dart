import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class MiBoton extends StatefulWidget {
  MiBoton({Key key}) : super(key: key);

  @override
  _MiBotonState createState() => _MiBotonState();
}

class _MiBotonState extends State<MiBoton> {
  String valueChoose;
  List tipomedicamento = ['Pastilla', 'Inyección', 'Jarabe', 'Gotas', 'Otro'];
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
            hint: Text("Tipo"),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.4,
            ),
            underline: SizedBox(),
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
      ),
    );
  }
}
