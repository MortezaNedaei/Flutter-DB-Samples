// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/local/db/note/note_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7329809726949800076),
      name: 'NoteEntity',
      lastPropertyId: const IdUid(4, 8574118718767745005),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4978465596836044985),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 59826898708969498),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1982595762983968353),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8574118718767745005),
            name: 'timestamp',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7329809726949800076),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    NoteEntity: EntityDefinition<NoteEntity>(
        model: _entities[0],
        toOneRelations: (NoteEntity object) => [],
        toManyRelations: (NoteEntity object) => {},
        getId: (NoteEntity object) => object.id,
        setId: (NoteEntity object, int id) {
          object.id = id;
        },
        objectToFB: (NoteEntity object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addInt64(3, object.timestamp);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = NoteEntity(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              description: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              timestamp:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [NoteEntity] entity fields to define ObjectBox queries.
class NoteEntity_ {
  /// see [NoteEntity.id]
  static final id =
      QueryIntegerProperty<NoteEntity>(_entities[0].properties[0]);

  /// see [NoteEntity.name]
  static final name =
      QueryStringProperty<NoteEntity>(_entities[0].properties[1]);

  /// see [NoteEntity.description]
  static final description =
      QueryStringProperty<NoteEntity>(_entities[0].properties[2]);

  /// see [NoteEntity.timestamp]
  static final timestamp =
      QueryIntegerProperty<NoteEntity>(_entities[0].properties[3]);
}
