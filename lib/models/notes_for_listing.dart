class NoteForListing {
  String noteid;
  String noteTitle;
  DateTime createdDate;
  DateTime editedTime;

  NoteForListing({
    this.noteid,
    this.noteTitle,
    this.createdDate,
    this.editedTime,
  });

  static List<NoteForListing> getNotes = [
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
