import 'package:flutter_db/data/local/db/note/note_entity.dart';

abstract class NoteDao {
  Future<int> insert(Map<String, dynamic> row);

  Future<List<NoteEntity>> getAll();

  Future<List<NoteEntity>> search(String query);

  Future<NoteEntity?> getItem(int id);

  Future<int> update(NoteEntity note);

  Future<int> delete(int id);
}
