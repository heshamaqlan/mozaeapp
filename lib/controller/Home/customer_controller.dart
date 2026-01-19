import 'package:get/get.dart';
import 'package:mozaeapp/db/Repositories/customer_repository.dart';
import 'package:mozaeapp/db/database_helper.dart';

import 'package:mozaeapp/model/customer_model.dart';

import 'package:flutter/material.dart';

class CustomerController extends GetxController {
  var customers = <Customer>[].obs;

  // TextEditingControllers
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final note = TextEditingController();

  final CustomerRepository repo = CustomerRepository();

  @override
  void onReady() {
    super.onReady();
    fetchCustomers();
  }

  void fetchCustomers() async {
    customers.value = await repo.getAll();
  }

  void addCustomer() async {
    final customer = Customer(
      name: name.text,
      phone: phone.text,
      address: address.text,
      note: note.text,
    );
    await repo.insert(customer);
    fetchCustomers();
    clearFields();
    Get.back();
  }

  void updateCustomer(Customer customer) async {
    final updated = Customer(
      id: customer.id,
      name: name.text,
      phone: phone.text,
      address: address.text,
      note: note.text,
    );
    await repo.update(updated);
    fetchCustomers();
    clearFields();
    Get.back();
  }

  void deleteCustomer(int id) async {
    await repo.delete(id);
    fetchCustomers();
  }

  void fillFields(Customer customer) {
    name.text = customer.name;
    phone.text = customer.phone;
    address.text = customer.address;
    note.text = customer.note;
  }

  void clearFields() {
    name.clear();
    phone.clear();
    address.clear();
    note.clear();
  }
}
