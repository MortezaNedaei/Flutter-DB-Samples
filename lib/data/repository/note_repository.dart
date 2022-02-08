import 'package:flutter/material.dart';
import 'package:flutter_db/data/local/db/db_helper.dart';
import 'package:flutter_db/data/local/db/note/note_dao.dart';
import 'package:flutter_db/data/local/db/note/note_entity.dart';
import 'package:sqflite/sqflite.dart';

class NoteRepository implements NoteDao {
  @override
  Future<NoteEntity?> getItem(int id) async {
    Database? db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db!.query(NoteEntity.tableName,
        columns: null,
        where: '${NoteEntity.columnID} = ?',
        whereArgs: [id],
        limit: 1);
    if (maps.isNotEmpty) {
      return NoteEntity.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<List<NoteEntity>> search(String query) async {
    Database? db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db!.query(NoteEntity.tableName,
        columns: [NoteEntity.columnName],
        where: 'name LIKE ?',
        whereArgs: ['%$query%']);
    return NoteEntity.toList(maps);
  }

  @override
  Future<List<NoteEntity>> getAll() async {
    Database? db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db!.query(NoteEntity.tableName);
    return NoteEntity.toList(maps);
  }

  @override
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!.insert(NoteEntity.tableName, row);
  }

  @override
  Future<int> update(NoteEntity note) async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!.update(NoteEntity.tableName, note.toMap(),
        where: '${NoteEntity.tableName} = ?', whereArgs: [note.id]);
  }

  @override
  Future<int> delete(int id) async {
    Database? db = await DatabaseHelper.instance.database;
    return await db!.delete(NoteEntity.tableName,
        where: '${NoteEntity.columnID} = ?', whereArgs: [id]);
  }
}

NoteRepository noteRepository = NoteRepository();
