import 'package:flutter/material.dart';
import 'package:medisave/models/alarma.dart';
import 'package:medisave/models/services_firestore.dart';

class Buscarxfecha extends StatefulWidget {
  Buscarxfecha({Key key}) : super(key: key);

  @override
  _Buscarxfecha createState() => _Buscarxfecha();
}

class _Buscarxfecha extends State<Buscarxfecha> {
  FirestoreService buscar = FirestoreService();
  final fechax = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Alarmas'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: fechax,
                  readOnly: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
                    labelText: 'Seleccione Fecha ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    setState(() {
                      fechax.text = date.toString().substring(0, 10);
                    });
                  },
                ),
                SizedBox(height: 20),
                (fechax.text.length) > 0
                    ? Expanded(
                        child: StreamBuilder<List<Alarma>>(
                          stream:
                              buscar.getByfecha(DateTime.parse(fechax.text)),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Alarma>> snapshot) {
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return new Text('Cargando...');
                              default:
                                final alarmas = snapshot.data;
                                return ListView.builder(
                                  itemCount: alarmas.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Alarma alarma = snapshot.data[index];

                                    return ListTile(
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          // Text(alarma.fecha.toString()),
                                          // Text(alarma.hora.toString()),
                                          IconButton(
                                            color: Colors.red,
                                            icon: Icon(Icons.delete),
                                            onPressed: () => _deleteAlarma(
                                                context, alarma.id),
                                          ),
                                        ],
                                      ),
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm4U4e_R3gp6jio8mJIHUtVd-ZdJXtxzdabQ&usqp=CAU'),
                                        radius: 20,
                                      ),
                                      title: Text(
                                          alarma.tipo + ' : ' + alarma.nombreA),
                                      subtitle: Text("Fecha" +
                                          ' :' +
                                          alarma.fecha
                                              .toString()
                                              .substring(0, 10) +
                                          ' | Hora ' +
                                          alarma.hora.hour.toString() +
                                          ":" +
                                          alarma.hora.minute.toString()),
                                    );
                                  },
                                );
                            }
                          },
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _deleteAlarma(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await FirestoreService().removeAlarma(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("¿Seguro que desea eliminar la alarma?"),
              actions: <Widget>[
                TextButton(
                    child: Text("Eliminar"),
                    onPressed: () => Navigator.pop(context, true)),
                TextButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
