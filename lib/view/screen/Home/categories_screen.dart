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
    return GetBuilder<CategoriesControllerImp>(
      init: CategoriesControllerImp(),
      builder:
          (controller) => Scaffold(
            backgroundColor: Appcolor.background,
            // appbar
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Customappbar(text: "قسم الأصناف"),
            ),

            //btn add
            floatingActionButton: FloatingActionButton(
              backgroundColor: Appcolor.basic,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Get.bottomSheet(
                  CustomeSbottomsheet(
                    title: "اضافة صنف",
                    sizedBox1: SizedBox(height: 10),

                    child1: Customtextfiled(
                      controller: controller.name,
                      hintText: "الصنف ",
                      suffixicon: Icon(Icons.category_rounded),
                    ),
                    sizedBox2: SizedBox(height: 10),

                    child2: Customtextfiled(
                      // onChanged: controller.price,
                      controller: controller.price,
                      hintText: "السعر",
                      suffixicon: Icon(Icons.price_change),
                    ),

                    onPressed: controller.save,
                    textbutton: "حفــــظ",
                  ),
                  isScrollControlled: true,
                  barrierColor: Appcolor.black.withOpacity(0.4),
                ).then((value) {
                  controller.onClear();
                });
              },
            ),

            body: Column(
              children: [
                SizedBox(height: 20),

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        CustomeSbottomsheet(
                          title: "تعديل صنف",
                          sizedBox1: SizedBox(height: 10),

                          child1: Customtextfiled(
                            controller: controller.name,
                            hintText: "الصنف ",
                            suffixicon: Icon(Icons.abc_outlined),
                          ),
                          sizedBox2: SizedBox(height: 10),
                          child2: Customtextfiled(
                            controller: controller.name,
                            hintText: "السعر",
                            suffixicon: Icon(Icons.abc_outlined),
                          ),
                          onPressed: controller.save,
                          textbutton: "تعديـــل",
                        ),
                        isScrollControlled: true,
                        barrierColor: Appcolor.black.withOpacity(0.4),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Appcolor.data,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'حلاوى هريسه',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '2500',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
