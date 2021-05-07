import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';

class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la app'),
      ),
       body: ListView(
        children: <Widget>[
          SizedBox(height: 8),
          Card(
            color: Color(0xffffffff),  
            child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              ListTile(
                title: Text('MEDISAVE', style: TextStyle(color: AppColors.BACKGROUND, fontWeight: FontWeight.bold),), 
                subtitle: Text('Recordatorio de medicamento', style: TextStyle(color: Colors.black.withOpacity(0.6)),),
              ),
              Padding(
                padding: const EdgeInsets.all(16.10),
                child: Text('Medisave es una app de recordatorio de medicamentos gratuita, está realizada con el fin de que el paciente pueda programar alarmas para recordar el momento de la toma del tratamiento.'
                ,style: TextStyle(color: Colors.black.withOpacity(0.6)))
              )               
            ])
          )
        ]
       )
    );
  }
}