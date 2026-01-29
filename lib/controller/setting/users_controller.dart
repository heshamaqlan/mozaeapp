import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/db/core/services/firebase_user_service.dart';
import 'package:mozaeapp/model/data/user_model.dart';

class UsersController extends GetxController {
  final FirebaseUserService service = FirebaseUserService();

  var users = <AppUser>[].obs;
  var isLoading = false.obs;

  // Controllers
  final email = TextEditingController();
  final password = TextEditingController();


  AppUser? editingUser;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    users.value = await service.getUsers();
  }

Future<void> addUser() async {
  if (email.text.isEmpty || password.text.isEmpty) {
    Get.snackbar("خطأ", "يرجى إدخال الإيميل وكلمة المرور");
    return;
  }

  await service.createUser(
    email: email.text.trim(),
    password: password.text.trim(),
  );

  await fetchUsers();
  clearForm();
  Get.back();
}

  void edit(AppUser user) {
    editingUser = user;
    email.text = user.email;

  }

  Future<void> updateUser() async {
    if (editingUser == null) return;

    final updated = AppUser(
      uid: editingUser!.uid,
      email: email.text.trim(),

      createdAt: editingUser!.createdAt,
    );

    await service.updateUser(updated);
    await fetchUsers();
    clearForm();
    Get.back();
  }

  Future<void> deleteUser(String uid) async {
    await service.deleteUser(uid);
    await fetchUsers();
  }

  void clearForm() {
    email.clear();
    password.clear();
    editingUser = null;
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
