import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/setting/users_controller.dart';
import 'package:mozaeapp/view/widget/Home/custome_sbottomsheet.dart';
import 'package:mozaeapp/view/widget/Public/customappbar.dart';
import 'package:mozaeapp/view/widget/Public/customtextfiled.dart';

class AddSelectUpdateDeleteUsers extends StatelessWidget {
  const AddSelectUpdateDeleteUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      init: UsersController(),
      builder:
          (controller) => Scaffold(
            backgroundColor: Appcolor.background,

            /// AppBar
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Customappbar(text: "قسم المستخدمين"),
            ),

            /// زر الإضافة
            floatingActionButton: FloatingActionButton(
              backgroundColor: Appcolor.basic,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                controller.clearForm();
                Get.bottomSheet(
                  _userBottomSheet(controller: controller, isEdit: false),
                  isScrollControlled: true,
                  barrierColor: Appcolor.black.withOpacity(0.4),
                );
              },
            ),

            /// Body
            body: Obx(
              () =>
                  controller.users.isEmpty
                      ? const Center(child: Text("لا يوجد مستخدمون"))
                      : ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          final user = controller.users[index];

                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              height: 150,
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
                              child: Row(
                                children: [
                                  /// معلومات المستخدم
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          user.email,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Cairo",
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                      ],
                                    ),
                                  ),

                                  /// أزرار التحكم
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /// تعديل
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Appcolor.basic,
                                        ),
                                        onPressed: () {
                                          controller.edit(user);
                                          Get.bottomSheet(
                                            _userBottomSheet(
                                              controller: controller,
                                              isEdit: true,
                                            ),
                                            isScrollControlled: true,
                                            barrierColor: Appcolor.black
                                                .withOpacity(0.4),
                                          );
                                        },
                                      ),

                                      /// حذف
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          Get.defaultDialog(
                                            title: "تأكيد الحذف",
                                            middleText:
                                                "هل أنت متأكد من حذف هذا المستخدم؟",
                                            textConfirm: "حذف",
                                            textCancel: "إلغاء",
                                            confirmTextColor: Colors.white,
                                            onConfirm: () {
                                              controller.deleteUser(user.uid);
                                              Get.back();
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ),
    );
  }

  Widget _userBottomSheet({
    required UsersController controller,
    required bool isEdit,
  }) {
    return CustomeSbottomsheet(
      title: isEdit ? "تعديل مستخدم" : "إضافة مستخدم",

      /// الإيميل
      child1: Customtextfiled(
        fieldType: FieldType.email,
        controller: controller.email,
        hintText: "البريد الإلكتروني",
        suffixicon: const Icon(Icons.email),
      ),

      /// كلمة المرور (تظهر فقط عند الإضافة)
      child2:
          isEdit
              ? null
              : Customtextfiled(
                fieldType: FieldType.text,
                controller: controller.password,
                hintText: "كلمة المرور",
                suffixicon: const Icon(Icons.lock),
              ),

      /// زر الحفظ
      onPressed: isEdit ? controller.updateUser : controller.addUser,
      textbutton: isEdit ? "تحديــــث" : "حفــــظ",
    );
  }
}
