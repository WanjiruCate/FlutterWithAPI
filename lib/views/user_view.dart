import 'package:flutter/material.dart';
import 'package:trial_http/models/user_model.dart';
import 'package:trial_http/services/user_post.dart';

class UserPost extends StatefulWidget {
  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  Future<List<User>> userList;

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(hintText: 'Phone number'),
              ),
              RaisedButton(
                child: Text('Post'),
                onPressed: () {
                  setState(() {
                    userList = createUser(
                        usernameController.text,
                        passwordController.text,
                        firstnameController.text,
                        lastnameController.text,
                        emailController.text,
                        phoneController.text);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
