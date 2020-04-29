import 'package:flutter/material.dart';
import 'package:trial_http/models/user_model.dart';
import 'package:trial_http/services/dio_create_token.dart';
import 'package:trial_http/services/dio_login.dart';
import 'package:trial_http/services/dio_upload.dart';

class EventPost extends StatefulWidget {
  @override
  _EventPostState createState() => _EventPostState();
}

class _EventPostState extends State<EventPost> {
  Future<List<User>> _futureUser;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Post Events'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(hintText: 'username'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'password'),
              ),
              RaisedButton(
                  child: Text('Post'),
                  onPressed: () {
                    setState(() {
                      _futureUser = createToken(
                        usernameController.text,
                        passwordController.text,
                      );
                      // _futureUser = login(
                      //   usernameController.text,
                      //   passwordController.text,
                      // );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
