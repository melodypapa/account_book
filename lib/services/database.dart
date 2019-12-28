import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Database get db => _db;

  DatabaseHelper.internal(){
    initDb();
  }

  void initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbName = join(documentsDirectory.path, "account_book.db");
    print("create database $dbName");
    _db = await openDatabase(dbName, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS Banks ("
        "bank_id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "branch_name TEXT,"
        "color TEXT"
        ")");
  }
}
