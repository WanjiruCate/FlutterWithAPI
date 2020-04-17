import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetEvent extends StatefulWidget {
  @override
  _GetEventState createState() => _GetEventState();
}

class _GetEventState extends State<GetEvent> {
  List data;
  String myUrl = 'http://157.245.163.170:8000/api/v1/events/';

  Future<String> getData() async {
    http.Response response = await http.get(
      myUrl,
      headers: {'Accept': 'application/json'},
    );
    // print(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[0]['description1']);
    return 'Success!!';
  }

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trial Flutter API'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: Column(
                children: <Widget>[
                  Text(
                    data[index]['description1'],
                  ),
                  Text(
                    data[index]['title'],
                  ),
                  Text(
                    data[index]['id'].toString(),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
