/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medisave/models/alarma.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Alarma>> getAlarmas()  {
    return _db.collection('Alarmas').snapshots().map((snapshot) =>

               snapshot.docs.map((doc) => Alarma.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setAlarma(Alarma alarma)) {
    var options = SetOptions(merge:  true);

    return _db
        .collection('Alarmas')
        .doc(alarma.id)
        .set(alarma.toMap(),  options);
  }

  //Delete
  Future<void> removeAlarma(String id)  {
    return _db.collection('Alarmas').doc(id).delete();
  }
}*/