import 'package:trial_http/models/api_response.dart';
import 'package:trial_http/models/notes_for_listing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotesService {
  static const urlApi = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': 'f629926c-6220-4405-b73b-d8d186b7168a'};
  Future<ApiResponse<List<NoteForListing>>> getNotesList() {
    return http.get(urlApi + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        final notes = <NoteForListing>[];

        for (var item in jsonData) {
          final note = NoteForListing(
            noteid: item['noteID'],
            noteTitle: item['noteTitle'],
            createdDate: DateTime.parse(
              item['createDateTime'],
            ),
            editedTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return ApiResponse<List<NoteForListing>>(data: notes);
      }
      return ApiResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An Error occured');
    }).catchError((_) => ApiResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An Error occured'));
  }
}
