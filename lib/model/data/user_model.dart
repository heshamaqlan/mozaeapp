import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final String email;
  final DateTime createdAt;

  AppUser({
    required this.uid,
    required this.email,
    required this.createdAt,
  });

  factory AppUser.fromJson(
    Map<String, dynamic> json,
    String docId,
  ) {
    return AppUser(
      uid: docId, // ✅ من documentId
      email: json['email'] ?? '',

      createdAt:
          (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'createdAt': createdAt,
    };
  }
}
