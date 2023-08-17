import 'package:sqflite/sqflite.dart';

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
          " startTime STRING, endTime STRING, "
          " remind INTEGER, repeat STRING, "
          " color INTEGER, "
          " isCompleted INTEGER)",
        );
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
