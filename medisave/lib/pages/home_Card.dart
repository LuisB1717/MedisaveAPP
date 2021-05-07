import 'package:flutter/material.dart';
import 'package:medisave/models/alarma.dart';
import 'package:medisave/models/services_firestore.dart';

class HomeCard extends StatefulWidget {
  HomeCard({Key key, this.alarma}) : super(key: key) {
    estado = alarma.estado;
  }
  final Alarma alarma;
  bool estado;
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(widget.alarma.tipo + ' : ' + widget.alarma.nombreA),
        subtitle: Text("Fecha" +
            ' :' +
            widget.alarma.fecha.toString().substring(0, 10) +
            ' | Hora ' +
            widget.alarma.hora.hour.toString() +
            ":" +
            widget.alarma.hora.minute.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm4U4e_R3gp6jio8mJIHUtVd-ZdJXtxzdabQ&usqp=CAU%27'),
          radius: 20,
        ),
        trailing: Switch(
          value: widget.estado,
          onChanged: (value) {
            setState(() {
              widget.estado = value;
              _updateteAlarma(widget.alarma.id, value);
            });
            // print(value);
          },
        ),
      ),
    );
  }

  void _updateteAlarma(String id, bool estado) async {
    try {
      await FirestoreService().updateAlarma(id, estado);
    } catch (e) {
      print(e);
    }
  }
}
