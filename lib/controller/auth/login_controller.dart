import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/approute.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

@override
Future<void> login() async {
  final emailText = email.text.trim();
  final passwordText = password.text.trim();

  if (emailText.isEmpty || passwordText.isEmpty) {
    Get.snackbar("خطأ", "يرجى إدخال البريد الإلكتروني وكلمة المرور");
    return;
  }

  try {
    isLoading.value = true;

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailText,
      password: passwordText,
    );

    // نجاح
    Get.offAllNamed(Approute.home);
  } on FirebaseAuthException catch (e) {
    String message = "حدث خطأ";

    if (e.code == 'user-not-found') {
      message = "لا يوجد حساب بهذا البريد";
    } else if (e.code == 'wrong-password') {
      message = "كلمة المرور غير صحيحة";
    } else if (e.code == 'invalid-email') {
      message = "البريد الإلكتروني غير صالح";
    }

    Get.snackbar("فشل تسجيل الدخول", message);
  } catch (e) {
    Get.snackbar("خطأ", "حدث خطأ غير متوقع");
  } finally {
    isLoading.value = false;
  }
}

  @override
  void goToForgetPassword() {
    Get.toNamed(Approute.forgetPassword);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
