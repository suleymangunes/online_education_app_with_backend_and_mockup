import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  User? issignin() {
    return _auth.currentUser;
  }

  String? infouser() {
    return _auth.currentUser?.uid;
  }

  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set({'userName': name, 'email': email, "password": password});

    return user.user;
  }
}
