import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medisave/models/alarma.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  static CollectionReference _db = FirebaseFirestore.instance
      .collection('Usuarios')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('Alarmas');

  Stream<List<Alarma>> getAlarmas() {
    return _db.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Alarma.fromJson(doc.data(), doc.id))
        .toList());
  }

  //Upsert
  static Future<DocumentReference> setAlarma(Alarma alarma) {
    var options = SetOptions(merge: true);

    return _db.add(alarma.toMap());
  }

  Future<void> removeAlarma(String id) {
    return _db.doc(id).delete();
  }

  Future<void> updateAlarma(String id, bool estado) {
    return _db.doc(id).update({'estado': estado});
  }

  Stream<List<Alarma>> getByfecha(DateTime fechax) {
    return _db
        .where('fecha', isEqualTo: Timestamp.fromDate(fechax))
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Alarma.fromJson(doc.data(), doc.id))
            .toList());
  }

  static Future<Alarma> getById(id) async {
    QuerySnapshot alarmasSnapshoot = await _db.get();
    List<Alarma> alarmas =
        alarmasSnapshoot.docs.map((e) => Alarma.fromJson(e.data(), e.id));
    return alarmas[0];
  }

  static Future<int> getalarmid() async {
    QuerySnapshot alarmasSnapshoot = await _db.get();
    List<Alarma> alarmas = alarmasSnapshoot.docs
        .map((e) => Alarma.fromJson(e.data(), e.id))
        .toList();
    if (alarmas.isEmpty) {
      return 1;
    }
    List idarray = alarmas.map((e) => e.ida).toList();
    idarray.sort();
    return idarray.last + 1;
  }

  // static Future<Alarma> cantidad() async {
  //   QuerySnapshot alarmasSnapshoot = await _db.get();
  //   Counter<Alarma> alarmas =
  //       alarmasSnapshoot.docs.map((e) => Alarma.fromJson(e.data(), e.id));
  //   return cantidad;
  // }
}
