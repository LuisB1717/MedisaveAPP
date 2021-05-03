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

  factory Alarma.fromJson(Map<String, dynamic> json) {
    return Alarma(
        json['id'],
        json['nombre'],
        json['tipo'],
        json['cantidad'],
        json['frecuencia'],
        json['duracion'],
        json['mensaje'],
        json['fecha'],
        json['hora']);
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': _nombreA,
      'tipo': _tipo,
      'cantidad': _cantidad,
      'frecuencia': _frecuencia,
      'duracion': _duracion,
      'mensaje': _mensaje,
      'fecha': _fecha,
      'hora': _hora,
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
}
