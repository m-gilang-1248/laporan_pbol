import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:datamahasiswa/model/data.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tabledata';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNim = 'nim';
  final String columnPhone = 'phone';
  final String columnAddress = 'address';
  final String columnImageBytes = 'imageBytes';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db  async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'data.db');

    return await openDatabase(path, version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  //membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
     var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
         "$columnName TEXT,"
         "$columnNim TEXT,"
         "$columnPhone TEXT,"
         "$columnAddress TEXT,"
         "$columnImageBytes BLOB)";
     await db.execute(sql);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
  if (oldVersion < 2) {
    // Lakukan migrasi atau perubahan struktur tabel
    await db.execute('ALTER TABLE $tableName ADD COLUMN $columnImageBytes BLOB');
  }
  // Implementasikan logika migrasi untuk versi lain jika diperlukan
}


  //insert ke database
  Future<int?> saveDataWithImage(Data data) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, data.toMapWithImage());
  }


  //read database
  Future<List?> getAllDataWithImage() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnNim,
      columnPhone,
      columnAddress,
      columnImageBytes
    ]);
    return result.toList();
  }


  //update database
  Future<int?> updateDataWithImage(Data data) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, data.toMapWithImage(), where: '$columnId = ?', whereArgs: [data.id]);
  }


  //hapus database
  Future<int?> deleteDataWithImage(int id) async {
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}