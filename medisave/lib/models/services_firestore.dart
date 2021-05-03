import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medisave/models/alarma.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  static CollectionReference _db = FirebaseFirestore.instance
      .collection('Usuarios')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('Alarmas');

  static Stream<List<Alarma>> getAlarmas() {
    return _db.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Alarma.fromJson(doc.data())).toList());
  }

  //Upsert
  static Future<DocumentReference> setAlarma(Alarma alarma) {
    var options = SetOptions(merge: true);

    return _db.add(alarma.toMap());
  }

  //Delete
  static Future<void> removeAlarma(String id) {
    return _db.doc(id).delete();
  }
}
