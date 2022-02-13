import 'package:flutter/material.dart';
import 'package:flutter_db/data/local/db/note/note_entity.dart';
import 'package:flutter_db/data/repository/note_repository.dart';

import '../components/list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldController = TextEditingController();
  List<MessageItem> items = List.empty();
  int _counter = 0;
  String _text = '';

  void _addNote() async {
    final timestamp = DateTime.now().millisecond;
    NoteEntity note = NoteEntity(
        name: _text.toString(),
        description: 'No.$_counter',
        timestamp: timestamp);
    final id = await noteRepository.insert(note);
    reset();
    _getNotes();
  }

  void _deleteNote(int id) async {
    final removedId = await noteRepository.delete(id);
    reset();
    _getNotes();
  }

  void reset() {
    textFieldController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _getNotes() async {
    final notes = await noteRepository.getAll();
    final count = notes.length;
    final list = notes.map((item) => MessageItem(item)).toList();

    setState(() {
      items = list;
      _counter = count;
      _text = '';
    });
  }

  void onChangeText() {
    setState(() {
      _text = textFieldController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _getNotes();
    textFieldController.addListener(onChangeText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'DB Notes count:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    iconSize: 24,
                    color: Colors.red,
                    splashColor: Colors.purple,
                    onPressed: () {
                      _deleteNote(item.item.id);
                    },
                  ),
                  onTap: () {
                    debugPrint('${item.item.id}');
                  },
                );
              },
            ),
          ),
          Container(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: textFieldController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a new note'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: _addNote,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
}
