import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/Home/product_details_controlker.dart';
import 'package:mozaeapp/view/widget/Home/customdropdown.dart';
import 'package:mozaeapp/view/widget/Home/custome_sbottomsheet.dart';
import 'package:mozaeapp/view/widget/Public/customappbar.dart';
import 'package:mozaeapp/view/widget/Public/customtextfiled.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControlkerrImp>(
      init: ProductDetailsControlkerrImp(),
      builder:
          (controller) => Scaffold(
            backgroundColor: Appcolor.background,
            // appbar
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Customappbar(text: "قســـم الطلبــات"),
            ),

            //btn add
            floatingActionButton: FloatingActionButton(
              backgroundColor: Appcolor.basic,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Get.bottomSheet(
                  CustomeSbottomsheet(
                    title: "اضافة طلب",
                    sizedBox1: SizedBox(height: 10),
                    child1: Customdropdown(
                      // labelText: "نوع الصنف",
                      hintText: " نــوع الصنف",
                      prefixIcon: Icons.category,
                      value: controller.selectedValue,
                      items: controller.myItems,
                      onChanged: (val) {
                        controller.changeValue(val);
                      },
                    ),
                    sizedBox2: SizedBox(height: 10),
                    child2: Customdropdown(
                      // labelText: "نوع الصنف",
                      hintText: "اسم العميل",
                      prefixIcon: Icons.person_2_rounded,
                      value: controller.selectedValue,
                      items: controller.myItems,
                      onChanged: (val) {
                        controller.changeValue(val);
                      },
                    ),
                    child3: Customtextfiled(
                      controller: controller.name,
                      hintText: "عدد الطلبات",
                      suffixicon: Icon(Icons.numbers_rounded),
                    ),
                    sizedBox3: SizedBox(height: 10),

                    child4: Customtextfiled(
                      // onChanged: controller.price,
                      controller: controller.price,
                      hintText: "رسوم القبض",
                      suffixicon: Icon(Icons.price_change),
                    ),
                    child5: Customtextfiled(
                      // onChanged: controller.price,
                      controller: controller.price,
                      hintText: "المتبقي",
                      suffixicon: Icon(Icons.price_change),
                    ),
                    child6: Customtextfiled(
                      // onChanged: controller.price,
                      controller: controller.price,
                      hintText: "ملاحظـــة",
                      suffixicon: Icon(Icons.notes_rounded),
                    ),

                    onPressed: () {
                      print("هشام هشام هشام");
                    },
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
                          title: "تعديل الطلــب",
                          sizedBox1: SizedBox(height: 10),
                          child1: Customdropdown(
                            // labelText: "نوع الصنف",
                            hintText: " نــوع الصنف",
                            prefixIcon: Icons.category,
                            value: controller.selectedValue,
                            items: controller.myItems,
                            onChanged: (val) {
                              controller.changeValue(val);
                            },
                          ),
                          sizedBox2: SizedBox(height: 10),
                          child2: Customdropdown(
                            // labelText: "نوع الصنف",
                            hintText: "اسم العميل",
                            prefixIcon: Icons.person_2_rounded,
                            value: controller.selectedValue,
                            items: controller.myItems,
                            onChanged: (val) {
                              controller.changeValue(val);
                            },
                          ),
                          child3: Customtextfiled(
                            controller: controller.name,
                            hintText: "عدد الطلبات",
                            suffixicon: Icon(Icons.numbers_rounded),
                          ),
                          sizedBox3: SizedBox(height: 10),

                          child4: Customtextfiled(
                            // onChanged: controller.price,
                            controller: controller.price,
                            hintText: "رسوم القبض",
                            suffixicon: Icon(Icons.price_change),
                          ),
                          child5: Customtextfiled(
                            // onChanged: controller.price,
                            controller: controller.price,
                            hintText: "المتبقي",
                            suffixicon: Icon(Icons.price_change),
                          ),
                          child6: Customtextfiled(
                            // onChanged: controller.price,
                            controller: controller.price,
                            hintText: "ملاحظـــة",
                            suffixicon: Icon(Icons.notes_rounded),
                          ),

                          onPressed: () {
                            print("هشام هشام هشام");
                          },
                          textbutton: "تعديــل",
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
