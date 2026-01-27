import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/approute.dart';

abstract class Settingcontroller extends GetxController {
  setting();
  // goToSignUP();
  goToSelectAddUpdatescreen();
  goToInformation();
}

class SettingcontrollerImp extends Settingcontroller {
  @override
  setting() {}

  @override
  goToInformation() {
    Get.toNamed(Approute.about);
  }

  @override
  goToSelectAddUpdatescreen() {
    Get.toNamed(Approute.users);
  }
}
