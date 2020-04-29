import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_http/models/user_model.dart';

Future<List<User>> createToken(String name, String password) async {
  String url = 'http://157.245.163.170:8000/api-token-auth/';
  Response response;
  Dio dio = new Dio();

  response = await dio.post(url, data: {
    'username': name,
    'password': password,
  });
  if (response.statusCode == 200) {
    print(response);
    var tokenValue = response.data['token'];
    // String responseBody = response.data;

    // dynamic decodedJson = jsonDecode(responseBody);
    //print('Token:' + decodedJson['token']);
    //var tokenValue = decodedJson['token'];

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', tokenValue);

    var value = pref.get('token');
    print('Value of Token : $value');

    return tokenValue;
  } else {
    print('Error' + response.data);
    print('Error in creating token, Status Code: ' +
        response.statusCode.toString());
    return null;
  }
  // http.Response response = await http.post(
  //   url,
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'categoryName': name,
  //   }),
  // );
  // if (response.statusCode == 200) {
  //   String responseBody = response.body;

  //   dynamic decodedJson = jsonDecode(responseBody);

  //   return decodedJson;
  // } else {
  //   print('Error in posting Categories Status Code: ' +
  //       response.statusCode.toString());
  //   return null;
  // }
}
