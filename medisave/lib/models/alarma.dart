import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Alarma {
  String _id;
  int _ida;
  String _nombreA;
  String _tipo;
  int _cantidad;
  int _frecuencia;
  String _mensaje;
  DateTime _fecha;
  DateTime _hora;
  bool _estado;

  Alarma(this._id, this._ida, this._nombreA, this._tipo, this._cantidad,
      this._frecuencia, this._mensaje, this._estado, this._fecha, this._hora);

  factory Alarma.fromJson(Map<String, dynamic> json, String id) {
    return Alarma(
        id,
        json['ida'],
        json['nombre'],
        json['tipo'],
        json['cantidad'],
        json['frecuencia'],
        json['mensaje'],
        json['estado'],
        DateTime.fromMicrosecondsSinceEpoch(
            json['fecha'].microsecondsSinceEpoch),
        DateTime.fromMicrosecondsSinceEpoch(
            json['hora'].microsecondsSinceEpoch));
  }

  Map<String, dynamic> toMap() {
    return {
      'ida': _ida,
      'nombre': _nombreA,
      'tipo': _tipo,
      'cantidad': _cantidad,
      'frecuencia': _frecuencia,
      'mensaje': _mensaje,
      'estado': _estado = false,
      'fecha': Timestamp.fromDate(_fecha),
      'hora': Timestamp.fromDate(_hora),
    };
  }

  String toString() {
    return jsonEncode({
      'ida': _ida,
      'nombre': _nombreA,
      'tipo': _tipo,
      'cantidad': _cantidad,
      'frecuencia': _frecuencia,
      'mensaje': _mensaje,
    });
  }

  String get id => _id;
  int get ida => _ida;
  String get nombreA => _nombreA;
  String get tipo => _tipo;
  int get cantidad => _cantidad;
  int get frecuencia => _frecuencia;
  String get mensaje => _mensaje;
  bool get estado => _estado;
  DateTime get fecha => _fecha;
  DateTime get hora => _hora;
}
