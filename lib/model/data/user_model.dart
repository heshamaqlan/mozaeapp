class AppUser {
  final String uid;
  final String email;
  final String role; // user | admin

  AppUser({
    required this.uid,
    required this.email,
    required this.role,
  });

  factory AppUser.fromJson(Map<String, dynamic> json, String docId) {
    return AppUser(
      uid: docId,
      email: json['email'] ?? '',
      role: json['role'] ?? 'user',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'role': role,
    };
  }
}
