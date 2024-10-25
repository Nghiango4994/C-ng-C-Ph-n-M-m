import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT,
            username TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    try {
      await db.insert('users', user);
      print("User added: $user");
    } catch (e) {
      print("Error inserting user: $e");
    }
  }

  // Fetch user by username and password
  Future<List<Map<String, dynamic>>> getUser(
      String username, String password) async {
    final db = await database;
    try {
      List<Map<String, dynamic>> result = await db.query(
        'users',
        where: 'username = ? AND password = ?',
        whereArgs: [username, password],
      );
      return result;
    } catch (e) {
      print("Error fetching user: $e");
      return [];
    }
  }
}
