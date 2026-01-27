import 'package:firebase_auth/firebase_auth.dart';

class FierbsseServices {
 static Future<void> singIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

static  Future<void> createAccont(String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

static  Future<void> singOut(String email, String password) async {
    await FirebaseAuth.instance.signOut();
  }
}
