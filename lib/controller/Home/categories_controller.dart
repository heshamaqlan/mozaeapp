import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/db/Repositories/category_repostari.dart';
import 'package:mozaeapp/model/category_model.dart';

class CategoriesController extends GetxController {
  var categories = <Category>[].obs;

  final name = TextEditingController();
  final price = TextEditingController();

  final CategoryRepostari repo = CategoryRepostari();
  @override
  void onReady() {
    super.onReady();
    fetchCategories();
  }

  void fetchCategories() async {
  
    categories.value = await repo.getAll();
  }

  void addCategory() async {
    final category = Category(
      name: name.text,
      price: double.tryParse(price.text) ?? 0.0,
    );
    await repo.insert(category);

    fetchCategories();
    clearFields();
    Get.back();
  }

  void updateCategory(Category category) async {
    final updated = Category(
      id: category.id,
      name: name.text,
      price: double.tryParse(price.text) ?? 0.0,
    );
    await repo.update(updated);

    fetchCategories();
    clearFields();
    Get.back();
  }

  void deleteCategory(int id) async {
    await repo.delete(id);

    fetchCategories();
  }

  void fillFields(Category category) {
    name.text = category.name;
    price.text = category.price.toString();
  }

  void clearFields() {
    name.clear();
    price.clear();
    super.onClose();
  }
}
