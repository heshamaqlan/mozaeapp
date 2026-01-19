import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppTheme { light, dark }

class ThemeController extends GetxController {
  Rx<AppTheme> selectedTheme = AppTheme.light.obs;

  void changeTheme(AppTheme theme) {
    selectedTheme.value = theme;

    if (theme == AppTheme.dark) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
