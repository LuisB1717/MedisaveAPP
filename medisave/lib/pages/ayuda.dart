import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class Ayuda extends StatefulWidget{
  @override
  _AyudaState createState() => _AyudaState();
}

class _AyudaState extends State<Ayuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      body: ListView(
        children: <Widget>[
        SizedBox(height: 8),
            ListTile(
              title: Text('Preguntas frecuentes', style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontSize: 20.0)),
              onTap: null,
            ),
            Divider(
                color: Colors.black,
                thickness: 1,
                indent: 18,
                endIndent: 18),
            ListTile(
              title: Text('¿Por qué debería crear una cuenta?', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Question1()))),
            ),
            ListTile(
              title: Text('¿Cómo creo una cuenta?', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Question1()))),
            ),
            ListTile(
              title: Text('¿Cómo creo una alarma para mi medicamento?', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Question1()))),
            ),
            ListTile(
              title: Text('¿Cómo elimino un medicamento?', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Question1()))),
            ),
            ListTile(
              title: Text('¿Cómo surgió la idea de crear esta app?', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold)),
              onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Question1()))),
            ),
        ]
      ),
    );
  }
}

class Question1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}