import 'package:flutter/material.dart';
import 'package:trial_http/getting.dart';
import 'package:trial_http/posting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: LoginPage(),
      // routes: <String, WidgetBuilder>{
      //   '/dashboard': (BuildContext context) => new Dashboard(title: title),
      //   '/adddata': (BuildContext context) => new AddData(title: title),
      //   '/register': (BuildContext context) => new RegisterPage(title: title),
      //   '/login': (BuildContext context) => new LoginPage(title: title),
      // },
    );
  }
}
