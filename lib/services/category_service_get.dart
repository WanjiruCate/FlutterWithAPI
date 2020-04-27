import 'package:trial_http/models/category_for_listing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Category>> getCategories() async {
  String url = 'http://157.245.163.170:8000/api/v1/categories/';

  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    String responseBody = response.body;

    dynamic decodedJson = jsonDecode(responseBody);

    List result = (decodedJson as List)
        .map((item) => new Category.getfromJson(item))
        .toList();

    return result;
  } else {
    print('Error in getting Categories: Status Code : ' +
        response.statusCode.toString());
    return null;
  }
}
