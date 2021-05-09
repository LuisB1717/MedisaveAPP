import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medisave/models/alarma.dart';
import 'package:medisave/models/services_firestore.dart';

void fireAlarm(id) async {
  /*final alarma = await FirestoreService.getById(id);*/
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
  await fltrnotifaction.show(0, "ALARMA MEDISAVE",
      "Hora de Tomar tu Medicamento", generalNotificationDetails);
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
  // FlutterLocalNotificationsPlugin fltrnotifaction =

  @override
  void initState() {
    super.initState();
  }

  int alid = 1;
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
              final result = await AndroidAlarmManager.periodic(
                  const Duration(seconds: 5), widget.alida, fireAlarm,
                  startAt: widget.alarma.fecha, exact: true);
              print(result);
              print("Alarma prendida");
            } else {
              AndroidAlarmManager.cancel(widget.alida);
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
