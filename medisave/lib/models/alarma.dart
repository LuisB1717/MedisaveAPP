class Alarma {
  String _id;
  String _nombreA;
  String _tipo;
  int _cantidad;
  int _frecuencia;
  int _duracion;
  String _mensaje;
  DateTime _fecha;

  Alarma(this._id, this._nombreA, this._tipo, this._cantidad, this._frecuencia,
      this._duracion, this._mensaje, this._fecha);

  factory Alarma.fromJson(Map<String, dynamic> json) {
    return Alarma(json['id'], json['nombre'], json['tipo'], json['cantidad'],
        json['frecuencia'], json['duracion'], json['mensaje'], json['fecha']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nombre': _nombreA,
      'tipo': _tipo,
      'cantidad': _cantidad,
      'frecuencia': _frecuencia,
      'duracion': _duracion,
      'mensaje': _mensaje,
      'fecha': _fecha,
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
