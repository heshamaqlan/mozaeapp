import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  late TextEditingController name;
  late TextEditingController price;
  }
class CategoriesControllerImp extends CategoriesController{
  @override
  void onInit() {
    name = TextEditingController();
    price = TextEditingController();
    super.onInit();
  }

  void save() {
    // print("هشام هشام هشام");
    if (name.text.isEmpty || price.text.isEmpty) {
      Get.snackbar(
        'تنبيه',
        'يرجى إدخال جميع الحقول',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.back();
  }

  @override
  void onClose() {
    name.dispose();
    price.dispose();
    super.onClose();
  }

  @override
  void onClear() {
    name.clear();
    price.clear();
    super.onClose();
  }

}
  

