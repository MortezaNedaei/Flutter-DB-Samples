import 'package:flutter_db/data/local/db/db_helper.dart';
import 'package:flutter_db/data/local/db/note/note_dao.dart';
import 'package:flutter_db/data/local/db/note/note_entity.dart';
import 'package:flutter_db/objectbox.g.dart';

class NoteRepository implements NoteDao {
  @override
  Future<NoteEntity?> getItem(int id) async {
    Store store = await DatabaseHelper.instance.store;
    return store.box<NoteEntity>().get(id);
  }

  @override
  Future<List<NoteEntity>> search(String query) async {
    Store store = await DatabaseHelper.instance.store;
    final _query =
        (store.box<NoteEntity>().query(NoteEntity_.name.equals(query))
              ..order(NoteEntity_.name))
            .build();
    final results = _query.find();
    _query.close();
    return results;
  }

  @override
  Future<List<NoteEntity>> getAll() async {
    Store store = await DatabaseHelper.instance.store;
    return store.box<NoteEntity>().getAll();
  }

  @override
  Future<List<NoteEntity?>> getMany(List<int> ids) async {
    Store store = await DatabaseHelper.instance.store;
    return store.box<NoteEntity>().getMany(ids);
  }

  @override
  Future<int> insert(NoteEntity note) async {
    Store store = await DatabaseHelper.instance.store;
    return await store.box<NoteEntity>().putAsync(note);
  }

  @override
  Future<List<int>> insertAll(List<NoteEntity> notes) async {
    Store store = await DatabaseHelper.instance.store;
    return store.box<NoteEntity>().putMany(notes);
  }

  @override
  Future<int> update(NoteEntity note) async {
    Store store = await DatabaseHelper.instance.store;
    return await store.box<NoteEntity>().putAsync(note);
  }

  @override
  Future<bool> delete(int id) async {
    Store store = await DatabaseHelper.instance.store;
    return store.box<NoteEntity>().remove(id);
  }

  @override
  Future<bool> deleteAll() async {
    Store store = await DatabaseHelper.instance.store;
    int removedCounts = store.box<NoteEntity>().removeAll();
    return removedCounts > 0;
  }
}

NoteRepository noteRepository = NoteRepository();
