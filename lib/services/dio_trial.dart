import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trial_http/models/category_for_listing.dart';

Future<List<Category>> getCategories() async {
  String url = 'http://157.245.163.170:8000/api/v1/categories/';
  Response response;
  Dio dio = new Dio();

  response = await dio.get(url);
  if (response.statusCode == 200) {
    print(response.data.toString());
    dynamic responseBody = response.data;
    // dynamic decodedJson = jsonDecode(responseBody);
    print(response.data);

    List result = (responseBody as List)
        .map((item) => new Category.getfromJson(item))
        .toList();

    return result;
  } else {
    print('Error in getting Categories: Status Code : ' +
        response.statusCode.toString());
    return null;
  }
}
