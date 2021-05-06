import 'package:flutter/material.dart';
import 'package:medisave/models/alarma.dart';
import 'package:medisave/models/services_firestore.dart';
import 'package:medisave/pages/strepAdd.dart';
import 'package:medisave/widgets/logged_in_widget.dart';
import 'strepAdd.dart';

class HomePageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xff158dad), title: Text('Medisave')),
      drawer: LoggedInWidget(),
      body: StreamBuilder(
        stream: FirestoreService().getAlarmas(),
        builder: (BuildContext context, AsyncSnapshot<List<Alarma>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Alarma alarma = snapshot.data[index];
              return ListTile(
                title: Text(alarma.nombreA),
                subtitle: Text(alarma.tipo),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(alarma.fecha.toString()),
                    Text(alarma.hora.toString()),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteAlarma(context, alarma.id),
                    ),
                  ],
                ),
                /*onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NoteDetailsPage(
                      note: note,
                    ),
                  ),
                ),*/
              );
            },
          );
        },
      ),

      //body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff158dad),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Addalarma()));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 5,
        highlightElevation: 10,
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
