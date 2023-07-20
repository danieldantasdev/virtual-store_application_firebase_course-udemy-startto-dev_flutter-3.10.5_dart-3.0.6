import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('user');

  bool isLoading = false;
  User? _firebaseUser;
  Map<String, dynamic> userData = {};

  void signIn() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void signUp(
      {required Map<String, dynamic> userData,
      required String pass,
      required VoidCallback onSuccess,
      required VoidCallback onFailed}) {
    isLoading = true;
    notifyListeners();

    _firebaseAuth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((value) async {
      _firebaseUser = value.user;
      await _saveUserData(userData);
      onSuccess();

      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      onFailed();
      isLoading = false;
      notifyListeners();
    });
  }

  void signOut() async {
    await _firebaseAuth.signOut();

    userData = {};
    _firebaseUser = null;
    notifyListeners();
  }

  void recoverPass() {}

  bool isLoggedIn() {
    return _firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await _usersCollection.doc(_firebaseUser?.uid).set(userData);
  }
}
