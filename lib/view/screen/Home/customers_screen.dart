import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/view/widget/Home/custome_sbottomsheet.dart';
import 'package:mozaeapp/view/widget/Public/customappbar.dart';
import 'package:mozaeapp/view/widget/Public/customtextfiled.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.background,
      // appbar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Customappbar(text: "قســم العمـــلاء"),
      ),

      //btn add
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.basic,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.bottomSheet(
            CustomeSbottomsheet(
              title: "اضافــة عميـل",
              sizedBox1: SizedBox(height: 10),
              //textfiled
              child1: Customtextfiled(
                // controller: controller.name,
                hintText: "اســـم العميل",
                suffixicon: Icon(Icons.person_2_rounded),
              ),
              sizedBox2: SizedBox(height: 10),
              child2: Customtextfiled(
                // controller: controller.price,
                hintText: "رقـــم العميل",
                suffixicon: Icon(Icons.phone),
              ),
              sizedBox3: SizedBox(height: 10),
              child3: Customtextfiled(
                // controller: controller.price,
                hintText: "العنــوان",
                suffixicon: Icon(Icons.location_city_rounded),
              ),
              sizedBox4: SizedBox(height: 10),
              child4: Customtextfiled(
                // controller: controller.price,
                hintText: "ملاحظــــة",
                suffixicon: Icon(Icons.notes_rounded),
              ),

              //btn_save
              // onPressed: controller.save,
              onPressed: () {
                print("هشام هشام هشام");
              },
              textbutton: "حفــــظ",
            ),
            isScrollControlled: true,
            barrierColor: Appcolor.black.withOpacity(0.4),
          ).then((value) {
            //clear the textfiled after close
            // controller.onClear();
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
                    title: "تعديـــل العميل",

                    sizedBox1: SizedBox(height: 10),
                    child1: Customtextfiled(
                      // controller: controller.name,
                      hintText: "اســـم العميل",
                      suffixicon: Icon(Icons.person_2_rounded),
                    ),
                    sizedBox2: SizedBox(height: 10),

                    child2: Customtextfiled(
                      // controller: controller.price,
                      hintText: "رقـــم العميل",
                      suffixicon: Icon(Icons.phone),
                    ),
                    sizedBox3: SizedBox(height: 10),
                    child3: Customtextfiled(
                      // controller: controller.price,
                      hintText: "العنــوان",
                      suffixicon: Icon(Icons.location_city_rounded),
                    ),

                    sizedBox4: SizedBox(height: 10),
                    child4: Customtextfiled(
                      // controller: controller.price,
                      hintText: "ملاحظــــة",
                      suffixicon: Icon(Icons.notes_rounded),
                    ),
                    // onPressed: controller.save,
                    onPressed: () {
                      print("هشام هشام هشام");
                    },
                    textbutton: "تعديـــل",
                  ),
                  isScrollControlled: true,
                  barrierColor: Appcolor.black.withOpacity(0.4),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 120,
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
                      'بقالة اليمن السعيد',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'الحصبة _ شارع مازدا_جوار محلات الشامل',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '963_771_777',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
