import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

            /// AppBar
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Customappbar(text: 'orders_section'.tr),
            ),

            /// زر الإضافة
            floatingActionButton: FloatingActionButton(
              backgroundColor: Appcolor.basic,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                controller.onClear();
                Get.bottomSheet(
                  CustomeSbottomsheet(
                    title: controller.isEditing ? 'edit_order'.tr : 'add_order'.tr,

                    /// الصنف
                    sizedBox1: const SizedBox(height: 10),
                    child1: Customdropdown(
                      hintText: 'category_type',
                      prefixIcon: Icons.category,
                      value: controller.selectedCategory,
                      items: controller.categoriesNames,
                      onChanged: controller.onCategoryChanged,
                    ),

                    /// العميل
                    sizedBox2: const SizedBox(height: 10),
                    child2: Customdropdown(
                      hintText: 'customer_name',
                      prefixIcon: Icons.person,
                      value: controller.selectedCustomer,
                      items: controller.customersNames,
                      onChanged: controller.onCustomerChanged,
                    ),

                    /// عدد
                    child3: Customtextfiled(
                      controller: controller.quantity,
                      hintText: 'orders_count',
                      suffixicon: const Icon(Icons.numbers),
                      fieldType: FieldType.number,
                      onChanged: controller.onQuantityChanged,
                    ),

                    sizedBox3: const SizedBox(height: 10),

                    /// تاريخ (غير قابل للتعديل)
                    child7: Customtextfiled(
                      controller: controller.orderDate,
                      hintText: 'order_date',
                      suffixicon: const Icon(Icons.date_range),
                      fieldType: FieldType.readonly,
                    ),

                    /// المدفوع
                    child4: Customtextfiled(
                      controller: controller.paid,
                      hintText: 'amount_paid',
                      fieldType: FieldType.decimal,
                      suffixicon: const Icon(Icons.price_change),
                      onChanged: controller.onPaidChanged,
                    ),

                    /// المتبقي
                    child5: Customtextfiled(
                      controller: controller.remaining,
                      hintText: 'amount_remaining',
                      fieldType: FieldType.decimal,
                      suffixicon: const Icon(Icons.price_change),
                      // readOnly: true,
                    ),

                    /// ملاحظة
                    child6: Customtextfiled(
                      controller: controller.note,
                      hintText: 'note',
                      suffixicon: const Icon(Icons.notes),
                      fieldType: FieldType.readonly,
                    ),

                    /// حفظ
                    onPressed: controller.save,
                    textbutton: controller.isEditing ? 'update' : 'save',
                  ),
                  isScrollControlled: true,
                  barrierColor: Appcolor.black.withOpacity(0.4),
                );
              },
            ),

            /// Body مع فلترة العملاء في الأعلى
            body: Column(
              children: [
                // شريط الفلترة بالأسماء (الكل + العملاء)
                SizedBox(
                  height: 56,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: Text(
                              'all'.tr,
                              style: const TextStyle(
                                color: Appcolor.white,
                                fontFamily: "Cairo",
                              ),
                            ),
                            selectedColor: Appcolor.basic,
                            backgroundColor: Appcolor.background,
                            selected: controller.filterCustomerId == null,
                            onSelected:
                                (_) => controller.setCustomerFilter(null),
                          ),
                        ),
                        ...controller.customers.map(
                          (c) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                              label: Text(
                                c.name,
                                style: TextStyle(
                                  color:
                                      controller.filterCustomerId == null
                                          ? Appcolor.black
                                          : Appcolor.white,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              selectedColor: Appcolor.basic,
                              backgroundColor: Appcolor.data,
                              selected: controller.filterCustomerId == c.id,
                              onSelected:
                                  (sel) => controller.setCustomerFilter(
                                    sel ? c.id : null,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // القائمة
                Expanded(
                  child: Obx(
                    () =>
                        controller.filteredOrders.isEmpty
                            ? Center(child: Text('no_orders'.tr))
                            : ListView.builder(
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 80,
                              ),
                              itemCount: controller.filteredOrders.length,
                              itemBuilder: (context, index) {
                                final order = controller.filteredOrders[index];

                                return Directionality(
                                  textDirection: (Get.locale?.languageCode == 'ar')
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: Container(
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
                                        // معلومات الطلب
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${'name'.tr}: ${order.customerName ?? 'unknown'.tr}',
                                                style: TextStyle(
                                                  color: Appcolor.black,
                                                  fontFamily: "Cairo",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '${'category'.tr}: ${order.categoryName ?? 'unknown'.tr}',
                                                style: TextStyle(
                                                  color: Appcolor.black,
                                                  fontFamily: "Cairo",
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '${'quantity'.tr}: ${order.quantity}',
                                                style: TextStyle(
                                                  color: Appcolor.black,
                                                  fontFamily: "Cairo",
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${'paid'.tr}: ${order.paid}',
                                                    style: TextStyle(
                                                      color: Appcolor.green,
                                                      fontFamily: "Cairo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Text(
                                                    '${'remaining'.tr}: ${order.remaining}',
                                                    style: TextStyle(
                                                      color:
                                                          order.remaining > 0
                                                              ? Appcolor.red
                                                              : Appcolor.black,
                                                      fontFamily: "Cairo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        // أزرار التحكم
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // تعديل
                                            IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                color: Appcolor.basic,
                                              ),
                                              onPressed: () {
                                                controller.editOrder(order);
                                                Get.bottomSheet(
                                                  CustomeSbottomsheet(
                                                    title: 'edit_order'.tr,
                                                    sizedBox1: const SizedBox(
                                                      height: 10,
                                                    ),
                                                    child1: Customdropdown(
                                                      hintText: 'category_type',
                                                      prefixIcon:
                                                          Icons.category,
                                                      value:
                                                          controller
                                                              .selectedCategory,
                                                      items:
                                                          controller
                                                              .categoriesNames,
                                                      onChanged:
                                                          controller
                                                              .onCategoryChanged,
                                                    ),
                                                    sizedBox2: const SizedBox(
                                                      height: 10,
                                                    ),
                                                    child2: Customdropdown(
                                                      hintText: 'customer_name',
                                                      prefixIcon: Icons.person,
                                                      value:
                                                          controller
                                                              .selectedCustomer,
                                                      items:
                                                          controller
                                                              .customersNames,
                                                      onChanged:
                                                          controller
                                                              .onCustomerChanged,
                                                    ),
                                                    child3: Customtextfiled(
                                                      controller:
                                                          controller.quantity,
                                                      hintText: 'orders_count',
                                                      fieldType:
                                                          FieldType.number,
                                                      suffixicon: const Icon(
                                                        Icons.numbers,
                                                      ),
                                                      onChanged:
                                                          controller
                                                              .onQuantityChanged,
                                                    ),
                                                    sizedBox3: const SizedBox(
                                                      height: 10,
                                                    ),
                                                    child7: Customtextfiled(
                                                      controller:
                                                          controller.orderDate,
                                                      hintText: 'order_date',
                                                      fieldType:
                                                          FieldType.readonly,
                                                      suffixicon: const Icon(
                                                        Icons.date_range,
                                                      ),
                                                    ),
                                                    child4: Customtextfiled(
                                                      controller:
                                                          controller.paid,
                                                      hintText:
                                                          'amount_paid',
                                                      fieldType:
                                                          FieldType.decimal,
                                                      suffixicon: const Icon(
                                                        Icons.price_change,
                                                      ),
                                                      onChanged:
                                                          controller
                                                              .onPaidChanged,
                                                    ),
                                                    child5: Customtextfiled(
                                                      controller:
                                                          controller.remaining,
                                                      hintText:
                                                          'amount_remaining',
                                                      fieldType:
                                                          FieldType.readonly,
                                                      suffixicon: const Icon(
                                                        Icons.price_change,
                                                      ),
                                                    ),
                                                    child6: Customtextfiled(
                                                      controller:
                                                          controller.note,
                                                      hintText: 'note',
                                                      suffixicon: const Icon(
                                                        Icons.notes,
                                                      ),
                                                      fieldType: FieldType.text,
                                                    ),
                                                    onPressed: controller.save,
                                                    textbutton: 'update',
                                                  ),
                                                  isScrollControlled: true,
                                                  barrierColor: Appcolor.black
                                                      .withOpacity(0.4),
                                                );
                                              },
                                            ),
                                            // ===== أيقونة الطباعة الجديدة =====
                                            IconButton(
                                              icon: Icon(
                                                Icons.print,
                                                color:
                                                    Appcolor
                                                        .green, // لون مختلف للتمييز
                                              ),
                                              onPressed: () {
                                                controller.printOrder(
                                                  order,
                                                ); // استدعاء دالة الطباعة
                                              },
                                            ),

                                            // // حذف
                                            // IconButton(
                                            //   icon: Icon(
                                            //     Icons.delete,
                                            //     color: Appcolor.red,
                                            //   ),
                                            //   onPressed: () {
                                            //     Get.defaultDialog(
                                            //       title: "تأكيد الحذف",
                                            //       titleStyle: const TextStyle(
                                            //         fontFamily: "Cairo",
                                            //         fontWeight: FontWeight.bold,
                                            //       ),
                                            //       middleText:
                                            //           "هل أنت متأكد من حذف هذا الطلب؟",
                                            //       middleTextStyle:
                                            //           const TextStyle(
                                            //             fontFamily: "Cairo",
                                            //           ),
                                            //       textConfirm: "حذف",
                                            //       textCancel: "إلغاء",
                                            //       cancelTextColor:
                                            //           Appcolor.black,
                                            //       confirmTextColor:
                                            //           Colors.white,
                                            //       buttonColor: Appcolor.basic,
                                            //       onConfirm: () {
                                            //         controller.deleteOrder(
                                            //           order.id!,
                                            //         );
                                            //         Get.back();
                                            //       },
                                            //     );
                                            //   },
                                            // ),
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
              ],
            ),
          ),
    );
  }
}
