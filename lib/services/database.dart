import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  static final tableBank = "Bank";

  factory DatabaseHelper() => _instance;
  static Database _db;

  Database get db => _db;

  DatabaseHelper.internal(){
    initDb();
  }

  void initDb() async {
    if (kDebugMode == true){
      await Sqflite.setDebugModeOn(true);
    }
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbName = join(documentsDirectory.path, "account_book.db");
    print("create database $dbName");
    _db = await openDatabase(dbName, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<String> loadSchema(String version) {
    return rootBundle.loadString('assets/db_schema/schema_$version.sql');
  }

  void _onCreate(Database db, int version) async {
    String statement = await loadSchema("1.0");
    try {
      await db.execute(statement);
    }
    catch (e){
      print(e);
    }
    /*await db.execute("CREATE TABLE IF NOT EXISTS Banks ("
        "bank_id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "branch_name TEXT,"
        "color TEXT"
        ")");*/
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async{
    if (oldVersion == 1 && newVersion == 2){
      String statement = await loadSchema("2.0");
      await db.execute(statement);
    }
  }
}
