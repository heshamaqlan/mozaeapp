import 'package:mozaeapp/db/database_helper.dart';
import 'package:mozaeapp/model/customer_model.dart';

class CustomerRepository {
  final dbHelper = DatabaseHelper.instance;

  // isertt
  Future<int> insert(Customer customer) async {
    final db = await dbHelper.database;
    return await db.insert('customers', customer.toJson());
  }

  //select
  Future<List<Customer>> getAll() async {
    final db = await dbHelper.database;
    final result = await db.query('customers');
    return result.map((e) => Customer.fromJson(e)).toList();
  }

  //update
  Future<int> update(Customer customer) async {
    final db = await dbHelper.database;
    return await db.update(
      'customers',
      customer.toJson(),
      where: 'id = ?',
      whereArgs: [customer.id],
    );
  }

  //deleta
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete('customers', where: 'id = ?', whereArgs: [id]);
  }
}
