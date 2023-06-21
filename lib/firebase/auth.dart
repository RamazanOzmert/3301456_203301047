import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseFireStore = FirebaseFirestore.instance;

Future<void> createUser(
  String name,
  String surname,
  String email,
  String password,
) async {
  try {
    var createUser = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    try {
      final resultData = await firebaseFireStore.collection("users").add({
        "email": email,
        "name": name,
        "surname": surname,
      });
    } catch (e) {
      debugPrint("HATA fireStore:" + e.toString());
    }
  } on FirebaseException catch (e) {}
}

Future<void> SignInUser(String email, String password) async {
  var SignInUser = firebaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  debugPrint('sign in user: ' + SignInUser.toString());
}

Future<void> SignOutUser() async {
  var SignOutUser = firebaseAuth.signOut();
  debugPrint('sign out user: ' + SignOutUser.toString());
}

Future<void> getUser() async {
  var SignOutUser = firebaseAuth;
  debugPrint('sign out user: ' + SignOutUser.toString());
}
