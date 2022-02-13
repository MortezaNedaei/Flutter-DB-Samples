import 'dart:io';

import 'package:flutter_db/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "todo.db";

  Store? _store;

  /// private constructor
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /// asking for a database
  Future<Store> get store async {
    if (_store != null) return _store!;

    // create a database if one doesn't exist
    _store = await _initDatabase();
    return _store!;
  }

  /// function to return a store
  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    _store = Store(
      getObjectBoxModel(),
      directory: join(directory.path, _databaseName),
    );

    _onCreate(_store!);
    return _store;
  }

  /// create a database since it doesn't exist
  Future _onCreate(Store store) async {
    // additional implementations
  }

  /// close db connection
  Future close() async => _store?.close();
}
