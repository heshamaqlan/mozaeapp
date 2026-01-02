import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/approute.dart';

abstract class LoginController extends GetxController {
  login();
  // goToSignUP();
  goToForgetPassword();
  goToHome();
}

class LogincontrollerImp extends LoginController {
  late TextEditingController username;
  late TextEditingController password;
  RxBool isPasswordHidden = true.obs;
  @override
  login() {}

  // @override
  // goToSignUP() {
  //   Get.toNamed(Approute.signup);
  // }
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  goToHome() {
    Get.offNamed(Approute.home);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(Approute.forgetPassword);
  }

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
