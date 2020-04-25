import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trial_http/models/api_response.dart';
import 'package:trial_http/models/notes_for_listing.dart';
import 'package:trial_http/services/notes_service.dart';
import 'package:trial_http/views/note_delete.dart';
import 'package:trial_http/views/note_modify.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.instance<NotesService>();

  ApiResponse<List<NoteForListing>> apiResponse;

  bool isLoading = false;
  // List<NoteForListing> _notes = NoteForListing.getNotes;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  void _fetchNotes() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await service.getNotesList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Notes'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NoteModify()));
          },
          child: Icon(Icons.add),
        ),
        body: Builder(builder: (_) {
          if (isLoading) {
            CircularProgressIndicator();
          }
          if (apiResponse.error) {
            return Center(child: Text(apiResponse.errorMessage));
          }
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(
              height: 1,
              color: Colors.green,
            ),
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(apiResponse.data[index].noteid),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  final result = await showDialog(
                      context: context, builder: (_) => NoteDelete());
                  print(result);
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteModify(
                                noteID: apiResponse.data[index].noteid)));
                  },
                  title: Text(
                    //  'hello',
                    apiResponse.data[index].noteTitle,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(
                      'Last Edited on ${formatDateTime(apiResponse.data[index].editedTime ?? apiResponse.data[index].createdDate)}'),
                  //Text(_notes[index].noteTitle),
                  // Text('Note 1')
                ),
              );
            },
            itemCount: apiResponse.data.length,
          );
        }));
  }
}
