import 'package:flutter/material.dart';

import 'package:medisave/models/recomendaciones.dart';

class Utils {
  static List<Recomendaciones> getRecomendaciones() {
    return [
      Recomendaciones(
          message:
              'Tener conexión a Internet \n Conexión Wifi  o \nDatos Móviles',
          img: 'wifi'),
      Recomendaciones(
          message: 'Mantener la Aplicación en Segundo Plano', img: 'bloqueo'),
      Recomendaciones(
          message: 'Desactivar el Modo de Ahorro de Batería', img: 'bateria'),
      Recomendaciones(
          message: 'Permitir Notificaciones de la Aplicación ',
          img: 'permisosnotif'),
      Recomendaciones(
          message: 'Activar Sonido del Teléfono Móvil', img: 'sonido'),
    ];
  }
}
