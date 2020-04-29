import 'package:flutter/material.dart';
import 'package:trial_http/models/category_for_listing.dart';
import 'package:trial_http/views/category_post.dart';
import 'package:trial_http/views/category_view_dropdown.dart';
import 'package:trial_http/views/event_post.dart';
import 'package:trial_http/views/upload_image.dart';

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

      home: EventPost(),
      // routes: <String, WidgetBuilder>{
      //   '/dashboard': (BuildContext context) => new Dashboard(title: title),
      //   '/adddata': (BuildContext context) => new AddData(title: title),
      //   '/register': (BuildContext context) => new RegisterPage(title: title),
      //   '/login': (BuildContext context) => new LoginPage(title: title),
      // },
    );
  }
}
