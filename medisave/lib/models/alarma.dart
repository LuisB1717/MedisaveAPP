import 'package:cloud_firestore/cloud_firestore.dart';

class Alarma {
  String _id;
  String _nombreA;
  String _tipo;
  int _cantidad;
  int _frecuencia;
  int _duracion;
  String _mensaje;
  DateTime _fecha;
  DateTime _hora;

  Alarma(this._id, this._nombreA, this._tipo, this._cantidad, this._frecuencia,
      this._duracion, this._mensaje, this._fecha, this._hora);

  factory Alarma.fromJson(Map<String, dynamic> json, String id) {
    return Alarma(
        id,
        json['nombre'],
        json['tipo'],
        json['cantidad'],
        json['frecuencia'],
        json['duracion'],
        json['mensaje'],
        DateTime.fromMicrosecondsSinceEpoch(
            json['fecha'].microsecondsSinceEpoch),
        DateTime.fromMicrosecondsSinceEpoch(
            json['hora'].microsecondsSinceEpoch));
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': _nombreA,
      'tipo': _tipo,
      'cantidad': _cantidad,
      'frecuencia': _frecuencia,
      'duracion': _duracion,
      'mensaje': _mensaje,
      'fecha': Timestamp.fromDate(_fecha),
      'hora': Timestamp.fromDate(_hora),
    };
  }

  String get id => _id;
  String get nombreA => _nombreA;
  String get tipo => _tipo;
  int get cantidad => _cantidad;
  int get frecuencia => _frecuencia;
  int get duracion => _duracion;
  String get mensaje => _mensaje;
  DateTime get fecha => _fecha;
  DateTime get hora => _hora;
}
