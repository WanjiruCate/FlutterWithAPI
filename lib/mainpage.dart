import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_http/posting.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SharedPreferences sharedpref;

  @override
  void initState() {
    // TODO: implement initState
    chexkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedpref.clear();
              sharedpref.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text('LogOut'),
          ),
        ],
      ),
      body: Center(
        child: Text('Miin Page'),
      ),
    );
  }

  void chexkLoginStatus() async {
    sharedpref = await SharedPreferences.getInstance();
    if (sharedpref.getString('token') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }
}
