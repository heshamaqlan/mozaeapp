import 'package:mozaeapp/db/database_helper.dart';
import 'package:mozaeapp/model/product_details_model.dart';

class ProductDetailsRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insert(ProductDetails details) async {
    final db = await dbHelper.database;
    return await db.insert('product_details', details.toJson());
  }

  Future<List<ProductDetails>> getAll() async {
    final db = await dbHelper.database;
    final result = await db.query('product_details');
    return result.map((e) => ProductDetails.fromJson(e)).toList();
  }

  Future<int> update(ProductDetails details) async {
    final db = await dbHelper.database;
    return await db.update(
      'product_details',
      details.toJson(),
      where: 'id = ?',
      whereArgs: [details.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'product_details',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
