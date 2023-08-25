import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class DBHelper {
  static Database? db;
  static const int version = 1;
  static const String tableName = "tasks";

  static Future<void> initDb() async {
    if (db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasktracer.db';
      db = await openDatabase(path, version: version, onCreate: (db, version) {
        // ignore: avoid_print
        print("creating a new one");
        return db.execute(
          "CREATE TABLE $tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          " title STRING, note TEXT, date STRING, "
          " repeat STRING, "
          " color INTEGER, "
          " isCompleted INTEGER)",
        );
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future<int> insert(TaskModel? taskModel) async {
    // ignore: avoid_print
    print("insert function called");
    return await db?.insert(tableName, taskModel!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    // ignore: avoid_print
    print("query function called");
    return await db!.query(tableName);
  }

  static delete(TaskModel taskModel) {
    db!.delete(tableName, where: 'id=?', whereArgs: [taskModel.id]);
  }

  static update(int id) {
    db!.rawUpdate('''
      UPDATE tasks
      SET isCompleted = ?
      WHERE id = ?
      ''', [1, id]);
  }
}
