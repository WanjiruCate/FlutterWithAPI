import 'package:flutter/material.dart';
import 'package:trial_http/views/notelist.dart';

class NoteModify extends StatelessWidget {
  final String noteID;

  bool get isEditing => noteID != null;

  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note' : 'Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NoteList()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
