class NoteEntity {
  static const tableName = "notes";
  static const columnID = 'id';
  static const columnName = "name";
  static const columnDescription = "description";
  static const columnTimestamp = "timestamp";

  late int id;
  late String name;
  late String description;
  late int timestamp;

  NoteEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.timestamp,
  });

  /// Convert a Note into a Map. The keys must correspond to the names of the
  /// columns in the database.
  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnID: id,
      columnName: name,
      columnDescription: description,
      columnTimestamp: timestamp,
    };
    return map;
  }

  /// Convert a Map into a Note. The keys must correspond to the names of the
  /// columns in the database.
  NoteEntity.fromMap(Map<String, dynamic> map) {
    id = map[id];
    name = map[name];
    description = map[description];
    timestamp = map[timestamp];
  }

  /// Convert the List<Map<String, dynamic> into a List<NoteEntity>
  static List<NoteEntity> toList(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      // Map Each Item to Entity
      return NoteEntity(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        timestamp: maps[i]['timestamp'],
      );
      // return NoteEntity.fromMap(maps[i]);
    });
  }

  @override
  String toString() {
    return 'NoteEntity{id: $id, name: $name, description: $description, timestamp: $timestamp}';
  }
}
