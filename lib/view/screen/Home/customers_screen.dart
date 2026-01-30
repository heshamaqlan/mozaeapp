import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/Home/customer_controller.dart';
import 'package:mozaeapp/view/widget/Home/custome_sbottomsheet.dart';
import 'package:mozaeapp/view/widget/Public/customappbar.dart';
import 'package:mozaeapp/view/widget/Public/customtextfiled.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerController controller = Get.put(CustomerController());
    return Scaffold(
      backgroundColor: Appcolor.background,

      /// AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Customappbar(text: 'customers_section'.tr),
      ),

   
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.basic,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          controller.clearFields();
          Get.bottomSheet(
            CustomeSbottomsheet(
              title: 'add_customer'.tr,

              sizedBox1: const SizedBox(height: 10),
              child1: Customtextfiled(
                controller: controller.name,
                hintText: 'customer_name',
                fieldType: FieldType.text,
                suffixicon: const Icon(Icons.person_2_rounded),
              ),

              sizedBox2: const SizedBox(height: 10),
              child2: Customtextfiled(
                controller: controller.phone,
                hintText: 'phone_number',
                fieldType: FieldType.phone,
                suffixicon: const Icon(Icons.phone),
              ),

              sizedBox3: const SizedBox(height: 10),
              child3: Customtextfiled(
                controller: controller.address,
                hintText: 'address',
                fieldType: FieldType.text,
                suffixicon: const Icon(Icons.location_city_rounded),
              ),

              sizedBox4: const SizedBox(height: 10),
              child4: Customtextfiled(
                controller: controller.note,
                hintText: 'note',
                fieldType: FieldType.text,
                suffixicon: const Icon(Icons.notes_rounded),
              ),

              textbutton: 'save',
              onPressed: controller.addCustomer,
            ),
            isScrollControlled: true,
            barrierColor: Appcolor.black.withOpacity(0.4),
          );
        },
      ),

      // body
      body: Obx(
        () =>
            controller.customers.isEmpty
                ? Center(child: Text('no_customers'.tr))
                : ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: controller.customers.length,
                  itemBuilder: (context, index) {
                    final customer = controller.customers[index];

                    return Directionality(
                      textDirection: (Get.locale?.languageCode == 'ar')
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: InkWell(
                        onTap: () {
                          controller.fillFields(customer);
                          Get.bottomSheet(
                            CustomeSbottomsheet(
                              title: 'edit_customer'.tr,

                              sizedBox1: const SizedBox(height: 10),
                              child1: Customtextfiled(
                                fieldType: FieldType.text,
                                controller: controller.name,
                                hintText: 'customer_name',
                                suffixicon: const Icon(Icons.person_2_rounded),
                              ),

                              sizedBox2: const SizedBox(height: 10),
                              child2: Customtextfiled(
                                fieldType: FieldType.phone,
                                controller: controller.phone,
                                hintText: 'phone_number',
                                suffixicon: const Icon(Icons.phone),
                              ),

                              sizedBox3: const SizedBox(height: 10),
                              child3: Customtextfiled(
                                fieldType: FieldType.text,
                                controller: controller.address,
                                hintText: 'address',
                                suffixicon: const Icon(
                                  Icons.location_city_rounded,
                                ),
                              ),

                              sizedBox4: const SizedBox(height: 10),
                              child4: Customtextfiled(
                                fieldType: FieldType.text,
                                controller: controller.note,
                                hintText: 'note',
                                suffixicon: const Icon(Icons.notes_rounded),
                              ),

                              textbutton: 'update',
                              onPressed:
                                  () => controller.updateCustomer(customer),
                            ),
                            isScrollControlled: true,
                            barrierColor: Appcolor.black.withOpacity(0.4),
                          );
                        },

                        /// كرت العميل
                        child: Container(
                          height: 120,
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
                                customer.name,
                                style: TextStyle(
                                  color: Appcolor.black,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                customer.address,
                                style: TextStyle(
                                  color: Appcolor.black,
                                  fontFamily: "Cairo",
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                customer.phone,
                                style: TextStyle(
                                  color: Appcolor.black,
                                  fontFamily: "Cairo",
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
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
