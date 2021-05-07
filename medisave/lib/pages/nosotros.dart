import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:medisave/helpers/appcolor.dart';

class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nosotros'),
      ),
      body: ListView(children: <Widget>[
        new Image.asset(
          'assets/imgs/medisave.png',
          width: 200,
          height: 200,
        ),
        ListTile(
          title: Text('Medisave',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.BACKGROUND,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          subtitle: Text('Version 1.0', textAlign: TextAlign.center),
        ),
        Text(
          '©2021 VLAM LAB ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(height: 4),
        Divider(
            color: AppColors.BACKGROUND,
            thickness: 1,
            indent: 18,
            endIndent: 18),
        ListTile(
          title: Text('Desarrollado por:',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.BACKGROUND,
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ),
        Linkify(
          onOpen: (link) => print("Clicked ${link.url}!"),
          text: "Barboza Acuña Luis ",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Linkify(
          onOpen: (link) => print("Clicked ${link.url}!"),
          text: "Torres Santa Cruz Christian",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Linkify(
          onOpen: (link) => print("Clicked ${link.url}!"),
          text: "Vázquez Cueva Mario",
          textAlign: TextAlign.center,
        ),
        Linkify(
          onOpen: (link) => print("Clicked ${link.url}!"),
          text: "Ortega Becerra Gustavo",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Linkify(
          onOpen: (link) => print("Clicked ${link.url}!"),
          text: "Timaná Calderón Junior",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
      ]),
    );
  }
}
