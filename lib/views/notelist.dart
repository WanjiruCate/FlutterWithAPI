import 'package:flutter/material.dart';
import 'package:trial_http/models/notes_for_listing.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<NoteForListing> _notes = NoteForListing.getNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.green,
        ),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              //  'hello',
              _notes[index].noteid,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(_notes[index].noteTitle),
            // Text('Note 1')
          );
        },
        itemCount: _notes.length,
      ),
    );
  }
}
