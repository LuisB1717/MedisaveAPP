import 'package:flutter/material.dart';

class IntervaloHoras extends StatefulWidget {
  IntervaloHoras({Key key}) : super(key: key);

  @override
  _IntervaloHoras createState() => _IntervaloHoras();
}

int value;
List intervalo = [4, 6, 8, 12, 20, 24];

class _IntervaloHoras extends State<IntervaloHoras> {
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
            hint: Text("Frecuencia de la toma"),
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
            items: intervalo
                .map((e) => DropdownMenuItem(
                      child: Text('Cada $e horas'),
                      value: e,
                    ))
                .toList()),
      ),
    );
  }
}
