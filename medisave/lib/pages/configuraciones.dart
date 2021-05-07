import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/informacion.dart';
import 'package:medisave/pages/nosotros.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(           
            title: Text('Recordatorios', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold ))
          ),
          ListTile(
            onTap: (){
              print('object');
            },
            title: Text('Recordatorio de notificaciones'),
          ),
          ListTile(           
            title: Text('Notificaciones', style: TextStyle(color: AppColors.BACKGROUND,fontWeight: FontWeight.bold ))
          ),
          ListTile(
            onTap: (){
              print('object');
            },
            title: Text('Sonido'),
          ),
          SwitchListTile(
            title: Text('Vibrar'),
            value: _switch,
            onChanged: (bool value){
              setState(() {
                _switch = value;
              });
            },
          ),
          ListTile(           
            title: Text('Medisave', style: TextStyle(color: AppColors.BACKGROUND, fontWeight: FontWeight.bold))
          ),
          ListTile(          
            leading: Icon(Icons.info),
            title: Text('Información'),
            onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Info()))),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Sobre Nosotros'),
            onTap: () => (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Nosotros()))),
          ),
        ],
      ),
    );
  }
}