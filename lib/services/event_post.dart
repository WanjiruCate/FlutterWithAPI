import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:trial_http/models/event.dart';

Future<List<Events>> createEvent(
  String name,
  // String image,
  String location,
  String latitude,
  String longitude,
  String title,
  String price,
  String eventOwner,
  String description2,
  String description1,
  String venue,
  String category,
  String eventdate,
  int maxTickets,
  bool status,
  bool isPaid,
  String dateToStopTicketing,
  String eventStartDate,
  String eventEndDate,
  String eventStartTime,
  String eventEndTime,
) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'id';
  final value = prefs.getString(key) ?? 0;

  String url = 'http://157.245.163.170:8000/api/v1/events/';

  http.Response response = await http.post(
    '$url',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      //'image': image,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'price': price,
      'eventOwner': eventOwner,
      'description1': description1,
      'description2': description2,
      'venue': venue,
      'category': category,
      'event_date': eventdate,
      'max_tickets': maxTickets,
      'status': status,
      'is_paid': isPaid,
      'date_to_stop_ticketing': dateToStopTicketing,
      'event_start_date': eventStartDate,
      'event_end_date': eventEndDate,
      'event_start_time': eventStartTime,
      'event_end_time': eventEndTime,
    }),
  );
  if (response.statusCode == 201) {
    String responseBody = response.body;
    dynamic decodedJson = jsonDecode(responseBody);

    print('Decoded Json $decodedJson');
  } else {
    print('Error in creating Event: Status Code : ' +
        response.statusCode.toString());
    print('Else Decoded Json ${jsonDecode(response.body)}');
  }
}
