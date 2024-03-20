import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{

  static Database? _db;

  Future<Database> get db async {
    if(_db != null)
      return _db!;
    _db = await initDb();
    return _db!;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE CharacterLocal(id INTEGER PRIMARY KEY, name TEXT,status TEXT, image TEXT)");
    print("Created tables");
  }

  // Retrieving employees from Employee Tables



  Future<List<CharacterLocal>?> fetchAllProducts() async {
    Database database = await db;
    List<Map<String, dynamic>> maps = await database.query('CharacterLocal');
    if (maps.isNotEmpty) {
      return maps.map((map) => CharacterLocal.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<int> addCast(CharacterLocal characterLocal) async {
    Database database = await db;
    return database.insert(
      'CharacterLocal',
      characterLocal.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateProduct(CharacterLocal characterLocal) async {
    Database database = await db;
    return database.update(
      'CharacterLocal',
      characterLocal.toDbMap(),
      where: 'id = ?',
      whereArgs: [characterLocal.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteProduct(int id) async {
    Database database = await db;
    return database.delete(
      'CharacterLocal',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> findProduct(int id) async {
    Database database = await db;
    var dbclient = await db;
    final count = await dbclient.query(
      "CharacterLocal",
      where: 'id = ?',
      whereArgs: [id],
    );
    return count.isEmpty;
  }

}