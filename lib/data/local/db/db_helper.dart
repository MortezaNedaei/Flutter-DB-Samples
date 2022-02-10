import 'dart:io';
import 'package:flutter_db/data/local/db/note/note_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

class DatabaseHelper {
  static const _databaseName = "todo.db";
  static const _databaseVersion = 1;
  static Database? _database;

  /// private constructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /// asking for a database
  Future<Database?> get database async {
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  /// function to return a database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  /// create a database since it doesn't exist
  Future _onCreate(Database db, int version) async {
    // sql code
    await db.execute('''
      CREATE TABLE ${NoteEntity.tableName} (
        ${NoteEntity.columnID} INTEGER PRIMARY KEY,
        ${NoteEntity.columnName} TEXT NOT NULL,
        ${NoteEntity.columnDescription} TEXT NOT NULL,
        ${NoteEntity.columnTimestamp} INTEGER NOT NULL
      );
      ''');
  }

  /// close db connection
  Future close() async => _database?.close();

  /// Check if a table exists
  Future<bool> tableExists(DatabaseExecutor db, String table) async {
    var count = firstIntValue(await db.query('sqlite_master',
        columns: ['COUNT(*)'],
        where: 'type = ? AND name = ?',
        whereArgs: ['table', table]));
    return count! > 0;
  }

  /// List table names
  Future<List<String>> getTableNames(DatabaseExecutor db) async {
    var tableNames = (await db
            .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
        .map((row) => row['name'] as String)
        .toList(growable: false)
      ..sort();
    return tableNames;
  }
}
