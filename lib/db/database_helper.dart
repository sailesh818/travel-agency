import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;
  DatabaseHelper._();

  Future<Database> get db async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'travel_agency.db');
    return await openDatabase(
      dbPath,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        password TEXT,
        role TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        destination TEXT,
        price TEXT,
        country TEXT,
        city TEXT,
        type TEXT,
        image TEXT,
        email TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
  }

  Future<void> close() async {
    final database = await db;
    await database.close();
  }

  Future<int> registerUser(String email, String password, String role) async {
    final database = await db;
    try {
      return await database.insert('users', {
        'email': email.trim(),
        'password': password.trim(),
        'role': role.trim(),
      });
    } catch (e) {
      return -1;
    }
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password, [String? role]) async {
    final database = await db;
    final result = await database.query(
      'users',
      where: role != null
          ? 'email = ? AND password = ? AND role = ?'
          : 'email = ? AND password = ?',
      whereArgs: role != null
          ? [email.trim(), password.trim(), role.trim()]
          : [email.trim(), password.trim()],
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> insertPackage(Map<String, dynamic> pkg) async {
    final database = await db;
    return await database.insert('packages', pkg);
  }

  Future<List<Map<String, dynamic>>> getAllPackages() async {
    final database = await db;
    return await database.query('packages', orderBy: 'id DESC');
  }

  Future<List<Map<String, dynamic>>> getPackagesByAgency(String agencyEmail) async {
    final database = await db;
    return await database.query(
      'packages',
      where: 'email = ?',
      whereArgs: [agencyEmail.trim()],
      orderBy: 'id DESC',
    );
  }

  Future<Map<String, dynamic>?> getPackageById(int id) async {
    final database = await db;
    final rows = await database.query(
      'packages',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows.isNotEmpty ? rows.first : null;
  }
}
