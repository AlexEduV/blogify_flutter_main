import 'package:blogify_flutter_main/data/database/user_table.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;

  DatabaseManager._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE ${UserTable.tableName}('
          '${UserTable.colId} INTEGER PRIMARY KEY, '
          '${UserTable.colFirstName} TEXT, '
          '${UserTable.colLastName} TEXT, '
          '${UserTable.colEmail} TEXT, '
          '${UserTable.colImageSrc} TEXT'
          ')',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(UserEntity user) async {
    final db = await database;
    await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UserEntity?> getUser() async {
    final db = await database;
    final map = await db.query('users');

    if (map.isEmpty) {
      return null;
    }

    return UserEntity.fromMap(map.first);
  }

  Future<void> updateUser(UserEntity user) async {
    final db = await database;
    await db.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
