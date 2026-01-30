import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/Home/categories_controller.dart';
import 'package:mozaeapp/view/widget/Home/custome_sbottomsheet.dart';
import 'package:mozaeapp/view/widget/Public/customappbar.dart';
import 'package:mozaeapp/view/widget/Public/customtextfiled.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesController controller = Get.put(CategoriesController());
    return Scaffold(
      backgroundColor: Appcolor.background,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Customappbar(text: 'categories_section'.tr),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.basic,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          controller.clearFields();
          Get.bottomSheet(
            CustomeSbottomsheet(
              title: 'add_category'.tr,

              sizedBox1: const SizedBox(height: 10),
              child1: Customtextfiled(
                fieldType: FieldType.text,
                controller: controller.name,
                hintText: 'category',
                suffixicon: const Icon(Icons.category_rounded),
              ),

              sizedBox2: const SizedBox(height: 10),
              child2: Customtextfiled(
                fieldType: FieldType.decimal,
                controller: controller.price,
                hintText: 'price',
                suffixicon: const Icon(Icons.price_change),
              ),

              onPressed: controller.addCategory,
              textbutton: 'save',
            ),
            isScrollControlled: true,
          );
        },
      ),

      body: Obx(
        () =>
            controller.categories.isEmpty
                ? Center(child: Text('no_categories'.tr))
                : ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];

                    return Directionality(
                      textDirection: (Get.locale?.languageCode == 'ar')
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: InkWell(
                        onTap: () {
                          controller.fillFields(category);
                          Get.bottomSheet(
                            CustomeSbottomsheet(
                              title: 'edit_category'.tr,

                              sizedBox1: const SizedBox(height: 10),
                              child1: Customtextfiled(
                                controller: controller.name,
                                fieldType: FieldType.text,
                                hintText: 'category',
                                suffixicon: const Icon(Icons.category_rounded),
                              ),

                              sizedBox2: const SizedBox(height: 10),
                              child2: Customtextfiled(
                                fieldType: FieldType.decimal,
                                controller: controller.price,
                                hintText: 'price',
                                suffixicon: const Icon(
                                  Icons.price_change_rounded,
                                ),
                              ),

                              onPressed:
                                  () => controller.updateCategory(category),
                              textbutton: 'update',
                            ),
                            isScrollControlled: true,
                          );
                        },

                        child: Container(
                          height: 100,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Appcolor.data,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                category.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(category.price.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
