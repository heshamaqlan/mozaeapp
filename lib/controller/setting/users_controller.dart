import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/db/core/services/firebase_user_service.dart';
import 'package:mozaeapp/model/data/user_model.dart';

class UsersController extends GetxController {
  final FirebaseUserService service = FirebaseUserService();

  /// قائمة المستخدمين
  var users = <AppUser>[].obs;

  /// Controllers
  final email = TextEditingController();
  final password = TextEditingController();

  /// role (user | admin)
  final role = 'user'.obs;

  AppUser? editingUser;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  /// جلب المستخدمين
  Future<void> fetchUsers() async {
    users.value = await service.getUsers();
  }

  /// إضافة مستخدم جديد
  Future<void> addUser() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("خطأ", "يرجى إدخال الإيميل وكلمة المرور");
      return;
    }

    await service.createUser(
      email: email.text.trim(),
      password: password.text.trim(),
      role: role.value,
    );

    await fetchUsers();
    clearForm();
    Get.back();
  }

  /// بدء التعديل
  void edit(AppUser user) {
    editingUser = user;
    email.text = user.email;
    role.value = user.role;
  }

  /// تحديث مستخدم (email + role)
  Future<void> updateUser() async {
    if (editingUser == null) return;

    final updated = AppUser(
      uid: editingUser!.uid,
      email: email.text.trim(),
      role: role.value,
    );

    await service.updateUser(updated);
    await fetchUsers();
    clearForm();
    Get.back();
  }

  /// حذف مستخدم
  Future<void> deleteUser(String uid) async {
    await service.deleteUser(uid);
    await fetchUsers();
  }

  /// تنظيف الفورم
  void clearForm() {
    email.clear();
    password.clear();
    role.value = 'user';
    editingUser = null;
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
