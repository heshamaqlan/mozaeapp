import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/db/Repositories/category_repostari.dart';
import 'package:mozaeapp/db/Repositories/customer_repository.dart';
import 'package:mozaeapp/db/Repositories/product_details_repository.dart';
import 'package:mozaeapp/model/category_model.dart';
import 'package:mozaeapp/model/customer_model.dart';
import 'package:mozaeapp/model/product_details_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  final productRepo = ProductDetailsRepository();
  final categoryRepo = CategoryRepostari();
  final customerRepo = CustomerRepository();

  var orders = <ProductDetails>[].obs;
  var categories = <Category>[];
  var customers = <Customer>[];

  int? selectedCategoryId;
  int? selectedCustomerId;

  List<String> categoriesNames = [];
  List<String> customersNames = [];

  double originalPrice = 0.0;

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

    orderDate.text = DateTime.now().toString().split(' ')[0];
    fetchInitialData();
    super.onInit();
  }

  Future<void> fetchInitialData() async {
    categories = await categoryRepo.getAll();
    customers = await customerRepo.getAll();

    categoriesNames = categories.map((e) => e.name).toList();
    customersNames = customers.map((e) => e.name).toList();

    orders.value = await productRepo.getAll();
    update();
  }

  void onCategoryChanged(String? value) {
    selectedCategory = value;
    final category = categories.firstWhere((e) => e.name == value);
    selectedCategoryId = category.id;

    originalPrice = category.price;

    calculateRemaining();
    update();
  }

  void onCustomerChanged(String? value) {
    selectedCustomer = value;
    final customer = customers.firstWhere((e) => e.name == value);
    selectedCustomerId = customer.id;
    update();
  }

  void setCustomerFilter(int? customerId) {
    filterCustomerId = customerId;
    update();
  }

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

      orderDate:
          isEditing
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

  void deleteOrder(int id) async {
    await productRepo.delete(id);
    orders.value = await productRepo.getAll();
    Get.snackbar("نجح", "تم حذف الطلب");
  }

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

  Future<void> printOrder(ProductDetails order) async {
    final fontData = await rootBundle.load(
      "assets/font/Cairo/Cairo-Regular.ttf",
    );
    final ttf = pw.Font.ttf(fontData);
    final boldFontData = await rootBundle.load(
      "assets/font/Cairo/Cairo-Bold.ttf",
    );
    final boldTtf = pw.Font.ttf(boldFontData);

    final pdf = pw.Document();

    final category = categories.firstWhere((c) => c.id == order.categoryId);
    final total = category.price * order.quantity;

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(base: ttf, bold: boldTtf),
        pageFormat: PdfPageFormat.a5,
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    "فاتورة طلب",
                    style: pw.TextStyle(font: boldTtf, fontSize: 24),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text("تطبيق Mozae", style: pw.TextStyle(font: boldTtf)),
                pw.Divider(),
                pw.SizedBox(height: 20),

                _buildInvoiceRow("رقم الطلب:", "${order.id}", boldTtf),
                _buildInvoiceRow(
                  "اسم العميل:",
                  "${order.customerName}",
                  boldTtf,
                ),
                _buildInvoiceRow("تاريخ الطلب:", order.orderDate, boldTtf),
                pw.SizedBox(height: 15),

                pw.Divider(),

                _buildInvoiceRow("الصنف:", "${order.categoryName}", boldTtf),
                _buildInvoiceRow("الكمية:", "${order.quantity}", boldTtf),
                _buildInvoiceRow(
                  "سعر الوحدة:",
                  "${category.price.toStringAsFixed(2)}",
                  boldTtf,
                ),

                pw.Divider(),
                pw.SizedBox(height: 15),

                _buildInvoiceRow(
                  "الإجمالي:",
                  total.toStringAsFixed(2),
                  boldTtf,
                ),
                _buildInvoiceRow(
                  "المبلغ المدفوع:",
                  order.paid.toStringAsFixed(2),
                  boldTtf,
                ),
                _buildInvoiceRow(
                  "المبلغ المتبقي:",
                  order.remaining.toStringAsFixed(2),
                  boldTtf,
                ),

                pw.SizedBox(height: 20),
                pw.Divider(),

                pw.SizedBox(height: 10),
                pw.Text("ملاحظات:", style: pw.TextStyle(font: boldTtf)),
                pw.Text(order.note.isEmpty ? "لا توجد ملاحظات" : order.note),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  pw.Widget _buildInvoiceRow(String title, String value, pw.Font boldFont) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(title, style: pw.TextStyle(font: boldFont)),
          pw.Text(value),
        ],
      ),
    );
  }
}
