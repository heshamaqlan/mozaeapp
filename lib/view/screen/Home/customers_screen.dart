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
        child: Customappbar(text: "قســم العمـــلاء"),
      ),

   
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.basic,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          controller.clearFields();
          Get.bottomSheet(
            CustomeSbottomsheet(
              title: "اضافــة عميـل",

              sizedBox1: const SizedBox(height: 10),
              child1: Customtextfiled(
                controller: controller.name,
                hintText: "اســـم العميل",
                fieldType: FieldType.text,
                suffixicon: const Icon(Icons.person_2_rounded),
              ),

              sizedBox2: const SizedBox(height: 10),
              child2: Customtextfiled(
                controller: controller.phone,
                hintText: "رقـــم الهاتف",
                fieldType: FieldType.phone,
                suffixicon: const Icon(Icons.phone),
              ),

              sizedBox3: const SizedBox(height: 10),
              child3: Customtextfiled(
                controller: controller.address,
                hintText: "العنــوان",
                fieldType: FieldType.text,
                suffixicon: const Icon(Icons.location_city_rounded),
              ),

              sizedBox4: const SizedBox(height: 10),
              child4: Customtextfiled(
                controller: controller.note,
                hintText: "ملاحظــــة",
                fieldType: FieldType.text,
                suffixicon: const Icon(Icons.notes_rounded),
              ),

              textbutton: "حفــــظ",
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
                ? const Center(child: Text("لا يوجد عملاء"))
                : ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: controller.customers.length,
                  itemBuilder: (context, index) {
                    final customer = controller.customers[index];

                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: InkWell(
                        onTap: () {
                          controller.fillFields(customer);
                          Get.bottomSheet(
                            CustomeSbottomsheet(
                              title: "تعديـــل العميل",

                              sizedBox1: const SizedBox(height: 10),
                              child1: Customtextfiled(
                                fieldType: FieldType.text,
                                controller: controller.name,
                                hintText: "اســـم العميل",
                                suffixicon: const Icon(Icons.person_2_rounded),
                              ),

                              sizedBox2: const SizedBox(height: 10),
                              child2: Customtextfiled(
                                fieldType: FieldType.phone,
                                controller: controller.phone,
                                hintText: "رقـــم الهاتف",
                                suffixicon: const Icon(Icons.phone),
                              ),

                              sizedBox3: const SizedBox(height: 10),
                              child3: Customtextfiled(
                                fieldType: FieldType.text,
                                controller: controller.address,
                                hintText: "العنــوان",
                                suffixicon: const Icon(
                                  Icons.location_city_rounded,
                                ),
                              ),

                              sizedBox4: const SizedBox(height: 10),
                              child4: Customtextfiled(
                                fieldType: FieldType.text,
                                controller: controller.note,
                                hintText: "ملاحظــــة",
                                suffixicon: const Icon(Icons.notes_rounded),
                              ),

                              textbutton: "تعديـــل",
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
