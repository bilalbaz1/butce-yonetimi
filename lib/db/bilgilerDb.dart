import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SqLiteDB {
  static final _databaseName = "bilgiler.db";
  static final _databaseVersion = 1;

  SqLiteDB._privateConstructor();
  static final SqLiteDB instance = SqLiteDB._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  // veritabani acar yoksa olusturur
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      //onUpgrade: _onUpgrade,
    );
  }

  // tablo olustur
  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE bilgiler (id INTEGER PRIMARY KEY AUTOINCREMENT, ad TEXT, resim TEXT);");
  }

  // tablo guncellle
  // Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
  //   if (newVersion > oldVersion) {
  //     await db.execute("ALTER TABLE bilgiler ADD COLUMN hedef INTEGER;");
  //   }
  // }
}
