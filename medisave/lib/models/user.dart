import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String nombre;
  String fotoURL;
  String email;

  User({
    this.nombre,
    this.fotoURL,
    this.email,
  });

  factory User.fromFirestore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data as Map;
    return User(
      nombre: userData['displayName'],
      fotoURL: userData['photoURL'],
      email: userData['email'],
    );
  }
  void setFromFireStore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data as Map;
    this.nombre = userData['displayName'];
    this.fotoURL = userData['photoURL'];
    this.email = userData['email'];
    notifyListeners();
  }
}
