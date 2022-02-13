import 'package:objectbox/objectbox.dart';

@Entity()
class NoteEntity {
  static const tableName = "notes";
  static const columnID = 'id';
  static const columnName = "name";
  static const columnDescription = "description";
  static const columnTimestamp = "timestamp";

  int id;
  String name;
  String? description;
  int timestamp;

  NoteEntity({
    this.id = 0,
    required this.name,
    this.description,
    required this.timestamp,
  });
}
