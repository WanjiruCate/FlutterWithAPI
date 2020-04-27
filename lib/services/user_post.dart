import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:trial_http/models/user_model.dart';

Future<List<User>> createUser(
  String username,
  String password,
  String firstName,
  String lastName,
  String email,
  String phoneNumber,
) async {
  String url = 'http://157.245.163.170:8000/api/v1/users/';
  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username': username,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phonenumber': phoneNumber,
    }),
  );
  if (response.statusCode == 201) {
    String responseBody = response.body;
    Map decodedJson = jsonDecode(responseBody);

    print('Data Token: ${decodedJson['auth_token']}');
    print('User ID: ${decodedJson['id']}');

    _saveToken('${decodedJson['auth_token']}');
    _saveUid('${decodedJson['id']}');

    List result = (decodedJson as List)
        .map((item) => new User.getfromJson(item))
        .toList();
    print('Result: $result');
    return result;

    //read($token);
  } else if (response.body.contains('error')) {
    var data = jsonDecode(response.body);
    print('Data :${data['error']}');
    return null;
  } else {
    print('Error in creating Users: Status Code : ' +
        response.statusCode.toString());
    var data = jsonDecode(response.body);
    print('${data['token']}');
    print('${data['id']}');
    return data as List;
  }
}

_saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();

  final key = 'auth_token';
  final value = token;

  prefs.setString(key, value);
  print('Token Value: ' + value);
}

_saveUid(String uid) async {
  final prefs = await SharedPreferences.getInstance();

  final key = 'id';
  final value = uid;

  prefs.setString(key, value);
  print('Value User Id: ' + value);
}

readToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.getString(key) ?? 0;
  print('read: $value');
}

readUid(String uid) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'id';
  final value = prefs.getString(key) ?? 0;
  print('read: $value');
}
