import 'package:mozaeapp/model/customer_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'mozae.db');
    return await openDatabase(
      path,
      version: 1,

      onCreate: (db, version) async {
        const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
        const textType = 'TEXT NOT NULL';
        const doubleType = 'REAL NOT NULL';
        const integerType = 'INTEGER NOT NULL';
        const numbricType = 'NUMERIC NOT NULL';

        await db.execute('''
        CREATE TABLE customers(
          id $idType,
          name $textType,
          phone $textType,
          address $textType,
          note $textType
        )
        ''');

        await db.execute('''
        CREATE TABLE categories(
          id $idType ,
          name $textType,
          price $doubleType
        )
        ''');
        await db.execute('''
CREATE TABLE product_details(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  order_date TEXT NOT NULL,
  paid REAL NOT NULL,
  remaining REAL NOT NULL,
  note TEXT,

  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
)
''');
      },
    );
  }
}
