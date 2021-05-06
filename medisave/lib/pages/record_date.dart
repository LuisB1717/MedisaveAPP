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
                      fechax.text = date.toString();
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
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm4U4e_R3gp6jio8mJIHUtVd-ZdJXtxzdabQ&usqp=CAU'),
                                        radius: 20,
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
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
