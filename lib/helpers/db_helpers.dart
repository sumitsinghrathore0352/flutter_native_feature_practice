import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> database() async{
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, "places.db"),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)",
        );
      },
      version: 1,
    );
  }
  static Future<void> insert(String table, Map<String, dynamic> data) async {
   final db = await DBHelper.database();
       db.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<List<Map<String, dynamic>>> getData(String table) async{
    final db = await DBHelper.database();
    return db.query(table);
  }
}
