import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> book() async {
    final user = <String, dynamic>{
      "first": "Alan",
      "middle": "Mathison",
      "last": "Turing",
      "born": 1912
    };

    await _db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
