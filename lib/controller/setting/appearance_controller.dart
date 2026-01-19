import 'package:get/get.dart';

class AppearanceController extends GetxController {
  var isOpen = false.obs;

  void toggle() {
    isOpen.value = !isOpen.value;
  }
}