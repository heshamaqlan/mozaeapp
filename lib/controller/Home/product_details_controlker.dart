import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/db/Repositories/category_repostari.dart';
import 'package:mozaeapp/db/Repositories/customer_repository.dart';
import 'package:mozaeapp/db/Repositories/product_details_repository.dart';
import 'package:mozaeapp/model/category_model.dart';
import 'package:mozaeapp/model/customer_model.dart';
import 'package:mozaeapp/model/product_details_model.dart';

abstract class ProductDetailsControlker extends GetxController {
  String? selectedCategory;
  String? selectedCustomer;

  late TextEditingController quantity;
  late TextEditingController orderDate;
  late TextEditingController paid;
  late TextEditingController remaining;
  late TextEditingController note;

  bool isEditing = false;
  ProductDetails? editingOrder;
}

class ProductDetailsControlkerrImp extends ProductDetailsControlker {
  /// Repositories
  final productRepo = ProductDetailsRepository();
  final categoryRepo = CategoryRepostari();
  final customerRepo = CustomerRepository();

  /// Data
  var orders = <ProductDetails>[].obs;
  var categories = <Category>[];
  var customers = <Customer>[];

  /// FK
  int? selectedCategoryId;
  int? selectedCustomerId;

  /// Dropdown
  List<String> categoriesNames = [];
  List<String> customersNames = [];

  /// السعر الأصلي للصنف
  double originalPrice = 0.0;

  /// فلترة حسب العميل
  int? filterCustomerId;
  List<ProductDetails> get filteredOrders =>
      filterCustomerId == null
          ? orders
          : orders.where((o) => o.customerId == filterCustomerId).toList();

  @override
  void onInit() {
    quantity = TextEditingController();
    orderDate = TextEditingController();
    paid = TextEditingController();
    remaining = TextEditingController();
    note = TextEditingController();
    // تثبيت تاريخ اليوم وعدم السماح بتعديله للمضافات الجديدة
    orderDate.text = DateTime.now().toString().split(' ')[0];
    fetchInitialData();
    super.onInit();
  }

  /// ===== تحميل البيانات =====
  Future<void> fetchInitialData() async {
    categories = await categoryRepo.getAll();
    customers = await customerRepo.getAll();

    categoriesNames = categories.map((e) => e.name).toList();
    customersNames = customers.map((e) => e.name).toList();

    orders.value = await productRepo.getAll();
    update();
  }

  /// ===== اختيار الصنف =====
  void onCategoryChanged(String? value) {
    selectedCategory = value;
    final category = categories.firstWhere((e) => e.name == value);
    selectedCategoryId = category.id;

    originalPrice = category.price;

    calculateRemaining();
    update();
  }

  /// ===== اختيار العميل =====
  void onCustomerChanged(String? value) {
    selectedCustomer = value;
    final customer = customers.firstWhere((e) => e.name == value);
    selectedCustomerId = customer.id;
    update();
  }

  /// تغيير فلترة العميل في واجهة الطلبات
  void setCustomerFilter(int? customerId) {
    filterCustomerId = customerId;
    update();
  }

  /// ===== الحساب الصحيح الوحيد =====
  void calculateRemaining() {
    final qty = int.tryParse(quantity.text) ?? 0;
    final paidValue = double.tryParse(paid.text) ?? 0.0;

    final total = originalPrice * qty;
    final remainingValue = total - paidValue;

    remaining.text = remainingValue.toStringAsFixed(2);
  }

  void onQuantityChanged(String value) {
    calculateRemaining();
    update();
  }

  void onPaidChanged(String value) {
    calculateRemaining();
    update();
  }

  /// ===== Save =====
  void save() async {
    final qty = int.tryParse(quantity.text);
    final paidValue = double.tryParse(paid.text);

    if (selectedCategoryId == null ||
        selectedCustomerId == null ||
        qty == null ||
        qty <= 0 ||
        paidValue == null ||
        paidValue < 0) {
      Get.snackbar("خطأ", "يرجى إدخال بيانات صحيحة");
      return;
    }

    final total = originalPrice * qty;
    final remainingValue = total - paidValue;

    final details = ProductDetails(
      id: isEditing ? editingOrder?.id : null,
      categoryId: selectedCategoryId!,
      customerId: selectedCustomerId!,
      quantity: qty,
      // تاريخ اليوم دائماً للطلبات الجديدة
      orderDate: isEditing
          ? (orderDate.text.isEmpty
              ? DateTime.now().toString().split(' ')[0]
              : orderDate.text)
          : DateTime.now().toString().split(' ')[0],
      paid: paidValue,
      remaining: remainingValue,
      note: note.text,
    );

    try {
      if (isEditing) {
        await productRepo.update(details);
        Get.snackbar("نجح", "تم تحديث الطلب");
      } else {
        await productRepo.insert(details);
        Get.snackbar("نجح", "تم حفظ الطلب");
      }

      orders.value = await productRepo.getAll();
      onClear();
      Get.back();
    } catch (_) {
      Get.snackbar("خطأ", "فشل حفظ الطلب");
    }
  }

  /// ===== Edit =====
  void editOrder(ProductDetails order) {
    isEditing = true;
    editingOrder = order;

    final category = categories.firstWhere((c) => c.id == order.categoryId);
    final customer = customers.firstWhere((c) => c.id == order.customerId);

    selectedCategory = category.name;
    selectedCustomer = customer.name;
    selectedCategoryId = category.id;
    selectedCustomerId = customer.id;

    originalPrice = category.price;

    quantity.text = order.quantity.toString();
    orderDate.text = order.orderDate;
    paid.text = order.paid.toString();
    remaining.text = order.remaining.toString();
    note.text = order.note;

    update();
  }

  /// ===== Delete =====
  void deleteOrder(int id) async {
    await productRepo.delete(id);
    orders.value = await productRepo.getAll();
    Get.snackbar("نجح", "تم حذف الطلب");
  }

  /// ===== Clear =====
  void onClear() {
    quantity.clear();
    orderDate.text = DateTime.now().toString().split(' ')[0];
    paid.clear();
    remaining.clear();
    note.clear();
    selectedCategory = null;
    selectedCustomer = null;
    selectedCategoryId = null;
    selectedCustomerId = null;
    originalPrice = 0.0;
    isEditing = false;
    editingOrder = null;
    update();
  }

  @override
  void onClose() {
    quantity.dispose();
    orderDate.dispose();
    paid.dispose();
    remaining.dispose();
    note.dispose();
    super.onClose();
  }
}
