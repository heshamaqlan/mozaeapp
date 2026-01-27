import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart' show Inst;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/auth/login_controller.dart';
import 'package:mozaeapp/view/widget/Home/custome_sbottomsheet.dart';
import 'package:mozaeapp/view/widget/Public/customtextfiled.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart';

class SelectAddUpdateUser extends StatelessWidget {
  const SelectAddUpdateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final LogincontrollerImp controller = Get.put(LogincontrollerImp());
    return Scaffold(
      backgroundColor: Appcolor.background,
      appBar: AppBar(
        title: const Text(
          "المستخدمين",
          style: TextStyle(
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
            color: Appcolor.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Appcolor.basic,
        elevation: 0,
        iconTheme: IconThemeData(color: Appcolor.white),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.basic,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.bottomSheet(
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomeSbottomsheet(
                title: "اضافة مستخدم جديد",

                sizedBox1: const SizedBox(height: 10),
                child1: Customtextfiled(
                  fieldType: FieldType.text,
                  controller: controller.username,
                  hintText: "اسم المستخدم",
                  suffixicon: const Icon(Icons.person_2_rounded),
                ),

                sizedBox2: const SizedBox(height: 10),
                child2: Customtextfiled(
                  fieldType: FieldType.decimal,
                  controller: controller.password,
                  hintText: "كلمة السر",
                  suffixicon: const Icon(Icons.password_rounded),
                ),

                onPressed: () {
                  print("save");
                },
                textbutton: "حفــــظ",
              ),
            ),
            isScrollControlled: true,
          );
        },
      ),
      backgroundColor: Appcolor.background,
    );
  }
}
