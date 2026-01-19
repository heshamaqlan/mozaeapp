import 'package:mozaeapp/db/database_helper.dart';
import 'package:mozaeapp/model/category_model.dart';

class CategoryRepostari {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insert(Category category) async {
    final db = await dbHelper.database;
    return await db.insert('categories', category.toJson());
  }

  Future<List<Category>> getAll() async {
    final db = await dbHelper.database;
    final result = await db.query('categories');
    return result.map((e) => Category.fromJson(e)).toList();
  }

  Future<int> update(Category category) async {
    final db = await dbHelper.database;
    return await db.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }
}
