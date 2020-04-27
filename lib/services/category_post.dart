import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trial_http/models/category_for_listing.dart';

Future<List<Category>> createCategory(String name) async {
  String url = 'http://157.245.163.170:8000/api/v1/categories/';

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'categoryName': name,
    }),
  );
  if (response.statusCode == 200) {
    String responseBody = response.body;

    dynamic decodedJson = jsonDecode(responseBody);

    return decodedJson;
  } else {
    print('Error in posting Categories Status Code: ' +
        response.statusCode.toString());
    return null;
  }
}
