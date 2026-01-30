import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozaeapp/model/data/user_model.dart';

class FirebaseUserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  Future<void> createUser({
    required String email,
    required String password,
    required String role, 
  }) async {
    final UserCredential cred =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(cred.user!.uid).set({
      'email': email,
      'role': role,
    });
  }


  Future<List<AppUser>> getUsers() async {
    final QuerySnapshot snapshot =
        await _firestore.collection('users').get();

    return snapshot.docs
        .map(
          (doc) => AppUser.fromJson(
            doc.data() as Map<String, dynamic>,
            doc.id,
          ),
        )
        .toList();
  }


  Future<void> updateUser(AppUser user) async {
    await _firestore.collection('users').doc(user.uid).update({
      'email': user.email,
      'role': user.role,
    });
  }


  Future<void> deleteUser(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }

  
  Future<void> updateCurrentUserPassword(String newPassword) async {
    await _auth.currentUser!.updatePassword(newPassword);
  }


  Future<AppUser?> getCurrentUser() async {
    final User? user = _auth.currentUser;
    if (user == null) return null;

    final doc =
        await _firestore.collection('users').doc(user.uid).get();

    if (!doc.exists) return null;

    return AppUser.fromJson(
      doc.data() as Map<String, dynamic>,
      doc.id,
    );
  }
}
