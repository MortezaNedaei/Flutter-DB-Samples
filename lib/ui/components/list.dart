import 'package:flutter/material.dart';
import 'package:flutter_db/data/local/db/note/note_entity.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildTime(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final NoteEntity item;

  MessageItem(this.item);


  @override
  Widget buildTitle(BuildContext context) => Text(item.name);

  @override
  Widget buildSubtitle(BuildContext context) => Text(item.description);

  @override
  Widget buildTime(BuildContext context) => Text('${item.timestamp}');
}
