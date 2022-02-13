import 'package:flutter_db/data/local/db/note/note_entity.dart';

abstract class NoteDao {
  Future<int> insert(NoteEntity note);

  Future<List<int>> insertAll(List<NoteEntity> notes);

  Future<List<NoteEntity>> getAll();

  Future<List<NoteEntity?>> getMany(List<int> ids);

  Future<List<NoteEntity>> search(String query);

  Future<NoteEntity?> getItem(int id);

  Future<int> update(NoteEntity note);

  Future<bool> delete(int id);

  Future<bool> deleteAll();
}
