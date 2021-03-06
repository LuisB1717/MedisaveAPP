import 'dart:convert';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medisave/models/alarma.dart';
import 'package:medisave/models/services_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

void fireAlarm(id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var alarmaString = prefs.getString('Alarma:${id}');

  var alarmaJson = jsonDecode(alarmaString);

  print('Alarm Fired at ${DateTime.now()}');
  print('Alarm Fired with id: ${id}');
  FlutterLocalNotificationsPlugin fltrnotifaction =
      FlutterLocalNotificationsPlugin();
  var androidinitialize = new AndroidInitializationSettings('mdvic');
  var iOSinitialize = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(
      android: androidinitialize, iOS: iOSinitialize);
  fltrnotifaction = new FlutterLocalNotificationsPlugin();
  fltrnotifaction.initialize(
    initializationSettings,
  );

  var androidDetais = new AndroidNotificationDetails(
      "ID", "notifiactionname", "desnotification",
      importance: Importance.max);
  var iosDetail = new IOSNotificationDetails();
  var generalNotificationDetails =
      new NotificationDetails(android: androidDetais, iOS: iosDetail);

  var schduledTime = DateTime.now().add(Duration(seconds: 5));
  await fltrnotifaction.show(
      0,
      "${alarmaJson['tipo']}: ${alarmaJson['nombre']} ",
      alarmaJson['mensaje'],
      generalNotificationDetails);
}

class HomeCard extends StatefulWidget {
  HomeCard({Key key, this.alarma}) : super(key: key) {
    estado = alarma.estado;
  }
  final int alida = 1;
  final Alarma alarma;
  bool estado;
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  void initState() {
    super.initState();
  }

  int alid = 1;
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
          onChanged: (value) async {
            setState(() {
              widget.estado = value;
              _updateteAlarma(widget.alarma.id, value);
            });

            if (widget.estado == true) {
              await AndroidAlarmManager.periodic(
                  Duration(hours: widget.alarma.frecuencia),
                  widget.alarma.ida,
                  fireAlarm,
                  startAt: widget.alarma.hora,
                  exact: true);
              print("Alarma prendida");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString(
                  'Alarma:${widget.alarma.ida}', widget.alarma.toString());
            } else {
              AndroidAlarmManager.cancel(widget.alarma.ida);

              print("Alarma Cancelada");
            }
            // print(value);
          },
        ),
      ),
    );
  }

  Future notificationSelected(String payload) async {}

  void _updateteAlarma(String id, bool estado) async {
    try {
      await FirestoreService().updateAlarma(id, estado);
    } catch (e) {
      print(e);
    }
  }
}

// FlutterLocalNotificationsPlugin fltrnotifaction =
/*
  Future _shwoNotification() async {
    var androidDetais = new AndroidNotificationDetails(
        "ID", "notifiactionname", "desnotification",
        importance: Importance.max);
    var iosDetail = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetais, iOS: iosDetail);

    var schduledTime = DateTime.now().add(Duration(seconds: 5));
    await fltrnotifaction.show(
        0, "TIPO Alarma", "TOMAR ALARMA INDICADA", generalNotificationDetails);
  }*/
