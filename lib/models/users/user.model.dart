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

  void signIn(
      {required String email,
      required String password,
      required VoidCallback onSuccess,
      required VoidCallback onFailed}) async {
    isLoading = true;
    notifyListeners();

    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      _firebaseUser = value.user;

      await _loadCurrentUser();

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      onFailed();
      isLoading = false;
      notifyListeners();
    });

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

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await _usersCollection.doc(_firebaseUser?.uid).set(userData);
  }

  Future<void> _loadCurrentUser() async {
    if (_firebaseUser == null) {
      _firebaseUser = await _firebaseAuth.currentUser!;
    } else if (_firebaseUser != null && userData["name"] == null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("user")
          .doc(_firebaseUser!.uid)
          .get();
      userData = (documentSnapshot.data() as Map<String, dynamic>);
    }
  }

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }
}
