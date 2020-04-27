import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trial_http/getting.dart';
import 'package:trial_http/models/category_for_listing.dart';
import 'package:trial_http/posting.dart';
import 'package:trial_http/services/category_service_get.dart';
import 'package:trial_http/services/notes_service.dart';
import 'package:trial_http/views/category_dropdown.dart';
import 'package:trial_http/views/category_post.dart';
import 'package:trial_http/views/category_view.dart';
import 'package:trial_http/views/category_view_dropdown.dart';
import 'package:trial_http/views/company_dropdown.dart';
import 'package:trial_http/views/notelist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Category category;
  final String title = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter APIs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: CategoryPost(),
      // routes: <String, WidgetBuilder>{
      //   '/dashboard': (BuildContext context) => new Dashboard(title: title),
      //   '/adddata': (BuildContext context) => new AddData(title: title),
      //   '/register': (BuildContext context) => new RegisterPage(title: title),
      //   '/login': (BuildContext context) => new LoginPage(title: title),
      // },
    );
  }
}
