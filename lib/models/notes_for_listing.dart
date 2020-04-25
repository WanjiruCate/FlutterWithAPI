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
      noteTitle: 'Title1',
      createdDate: DateTime.now(),
      editedTime: DateTime.now(),
    ),
    NoteForListing(
      noteid: '2',
      noteTitle: 'Title2',
      createdDate: DateTime.now(),
      editedTime: DateTime.now(),
    ),
    NoteForListing(
      noteid: '3',
      noteTitle: 'Title3',
      createdDate: DateTime.now(),
      editedTime: DateTime.now(),
    ),
    NoteForListing(
      noteid: '4',
      noteTitle: 'Title4',
      createdDate: DateTime.now(),
      editedTime: DateTime.now(),
    ),
  ];
}
