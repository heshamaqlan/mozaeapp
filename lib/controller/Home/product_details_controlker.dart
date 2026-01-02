import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsControlker extends GetxController {
  String? selectedValue;
  late TextEditingController name;
  late TextEditingController price;
  List<String> myItems = ["إلكترونيات", "أدوات منزلية", "ملابس"];
}

class ProductDetailsControlkerrImp extends ProductDetailsControlker {
  void changeValue(String? val) {
    selectedValue = val;
    update(); // تحديث الواجهة
  }

  @override
  void onInit() {
    name = TextEditingController();
    price = TextEditingController();
    super.onInit();
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
