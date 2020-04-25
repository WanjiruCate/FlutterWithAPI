import 'package:trial_http/models/notes_for_listing.dart';

class NotesService {
  List<NoteForListing> getNotesList() {
    return [
      NoteForListing(
        noteid: '1',
        noteTitle: 'Title 1',
        createdDate: DateTime.now(),
        editedTime: DateTime.now(),
      ),
      NoteForListing(
        noteid: '2',
        noteTitle: 'Title 2',
        createdDate: DateTime.now(),
        editedTime: DateTime.now(),
      ),
      NoteForListing(
        noteid: '3',
        noteTitle: 'Title 3',
        createdDate: DateTime.now(),
        editedTime: DateTime.now(),
      ),
      NoteForListing(
        noteid: '4',
        noteTitle: 'Title 4',
        createdDate: DateTime.now(),
        editedTime: DateTime.now(),
      ),
    ];
  }
}
