import 'package:flutter/material.dart';
import 'package:medisave/models/alarma.dart';
import 'package:medisave/models/services_firestore.dart';
import 'package:medisave/pages/home_Card.dart';
import 'package:medisave/pages/strepAdd.dart';
import 'package:medisave/widgets/logged_in_widget.dart';
import 'strepAdd.dart';

class HomePageLogin extends StatefulWidget {
  @override
  _HomePageLoginState createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  bool estado = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff158dad),
          title:
              Text('Medisave', style: TextStyle(fontStyle: FontStyle.italic))),
      drawer: LoggedInWidget(),
      body: StreamBuilder(
        stream: FirestoreService().getAlarmas(),
        builder: (BuildContext context, AsyncSnapshot<List<Alarma>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Alarma alarma = snapshot.data[index];
                  return HomeCard(
                    alarma: alarma,
                  );
                },
              ),
            ),
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
}
