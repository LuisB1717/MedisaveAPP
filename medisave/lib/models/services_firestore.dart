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

  //Delete
  Future<void> removeAlarma(String id) {
    return _db.doc(id).delete();
  }

  Future<void> updateAlarma(String id, bool estado) {
    return _db.doc(id).update({'estado': estado});
  }
  // Future<void> updateAlarmaF(String id) {
  //   return _db.doc(id).update({'estado': false});
  // }

  Stream<List<Alarma>> getByfecha(DateTime fechax) {
    return _db
        .where('fecha', isEqualTo: Timestamp.fromDate(fechax))
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Alarma.fromJson(doc.data(), doc.id))
            .toList());
  }
}
