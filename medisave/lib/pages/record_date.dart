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
        child: Column(
          children: [
            TextFormField(
              controller: fechax,
              readOnly: true,
              decoration: InputDecoration(hintText: 'Seleccionar Fecha'),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                setState(() {
                  fechax.text = date.toString();
                });
              },
            ),
            (fechax.text.length) > 0
                ? Expanded(
                    child: StreamBuilder<List<Alarma>>(
                      stream: buscar.getByfecha(DateTime.parse(fechax.text)),
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
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                  ),
                                  title: Text(alarmas[index].nombreA),
                                  subtitle:
                                      Text(alarmas[index].fecha.toString()),
                                );
                              },
                            );
                            ;
                        }
                      },
                    ),
                  )
                : Text('Campo Vacio'),
          ],
        ),
      ),
    );
  }
}
