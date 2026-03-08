import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/setting/users_controller.dart';
import 'package:mozaeapp/view/widget/Home/customdropdown.dart';
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

        
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Customappbar(text: 'users_management'.tr),
            ),

           
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

           
            body: Obx(
              () =>
                  controller.users.isEmpty
                      ? Center(child: Text('no_users'.tr))
                      : ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          final user = controller.users[index];

                          return Directionality(
                            textDirection:
                                (Get.locale?.languageCode == 'ar')
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                            child: Container(
                              height: 160,
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
                                        const SizedBox(height: 8),
                                        Text(
                                          '${'role'.tr}: ${user.role}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Cairo",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                       
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  
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

                                 
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Appcolor.red,
                                        ),
                                        onPressed: () {
                                          Get.defaultDialog(
                                            backgroundColor:
                                                Appcolor.background,
                                            title: 'confirm_delete'.tr,
                                            titleStyle: const TextStyle(
                                              fontFamily: "Cairo",
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            middleText:
                                                'confirm_delete_user'.tr,
                                            middleTextStyle: const TextStyle(
                                              fontFamily: "Cairo",
                                              fontSize: 14,
                                            ),
                                            textConfirm: 'delete'.tr,
                                            textCancel: 'cancel'.tr,
                                            confirmTextColor: Appcolor.white,
                                            cancelTextColor: Appcolor.black,
                                            buttonColor: Appcolor.basic,

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
      title: isEdit ? 'edit_user'.tr : 'add_user'.tr,

      child1: Obx(
        () => Customdropdown(
          hintText: 'role',
          value: controller.role.value,
          items: const ['user', 'admin'],
          prefixIcon: Icons.admin_panel_settings,
          onChanged: (value) {
            if (value != null) {
              controller.role.value = value;
            }
          },
        ),
      ),

      child2: Column(
        children: [
          Customtextfiled(
            fieldType: FieldType.email,
            controller: controller.email,
            hintText: 'email',
            suffixicon: const Icon(Icons.email),
          ),

          // const SizedBox(height: 10),

    
          if (!isEdit)
            Customtextfiled(
              fieldType: FieldType.password,
              controller: controller.password,
              hintText: 'password',
              suffixicon: const Icon(Icons.lock),
            ),
          const SizedBox(height: 10),
        ],
      ),

   
      onPressed: isEdit ? controller.updateUser : controller.addUser,
      textbutton: isEdit ? 'update' : 'save',
    );
  }
}
