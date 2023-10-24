import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rola_app/models/bookings.dart';

class FireStoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> createUser(
      {required String email, required String password}) async {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    //
    // await _db.collection("users").add(user).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<UserCredential?> login(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
      return null;
    }

    //
    // await _db.collection("users").add(user).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> createBooking(Booking booking) async {
    try {
      await _db.collection('bookings').add(booking.toJson()).then(
            (value) => log('booked ${value.id}'),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List?> getBookings() async {
    try {
      var list = [];
      await _db.collection('bookings').get().then((value) {
        for (var docSnapshot in value.docs) {
          list.add(docSnapshot.data());
        }
      });
      return list;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
