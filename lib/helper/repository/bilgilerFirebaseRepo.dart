import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BilgilerFirebase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> ekle(
      {@required String userId, @required String ad, @required String resim}) {
    return users
        .doc(userId)
        .set({'ad': ad, 'resim': resim, 'userId': userId}).then((value) {
      print("Basarili");
      return true;
    }).catchError((e) {
      print("ekle HATA: $e");
      return false;
    });
  }

  Future<bool> guncelle(
      {@required String userId, @required String ad, @required String resim}) {
    return users
        .doc(userId)
        .update({'ad': ad, 'resim': resim, 'userId': userId}).then((value) {
      print("basarili");
      return true;
    }).catchError((e) {
      print("HATA : $e");
      return false;
    });
  }
}
