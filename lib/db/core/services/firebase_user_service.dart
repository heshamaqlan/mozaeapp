import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozaeapp/model/data/user_model.dart';

class FirebaseUserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required String email,
    required String password,
    
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(cred.user!.uid).set({
      'uid': cred.user!.uid,
      'email': email,
    
      'createdAt': Timestamp.now(),
    });
  }

  Future<List<AppUser>> getUsers() async {
    final snapshot = await _firestore.collection('users').get();

    return snapshot.docs
        .map(
          (doc) => AppUser.fromJson(
            doc.data(),
            doc.id, 
          ),
        )
        .toList();
  }

  Future<void> updateUser(AppUser user) async {
    await _firestore.collection('users').doc(user.uid).update({
      'email': user.email,
    });
  }

  Future<void> deleteUser(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }
}
