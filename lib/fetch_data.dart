import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:trial_http/album.dart';

class CountriesAll extends StatefulWidget {
  @override
  _CountriesAllState createState() => _CountriesAllState();
}

class _CountriesAllState extends State<CountriesAll> {
  Future<Album> futureAlbum;
  // Future<http.Response> fetchAlbum() {
  //   return http.get('https://restcountries.eu/rest/v2/all');
  // }

  Future<Album> fetchAlbum() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Abum');
    }
  }

  @override
  void initState() {
    futureAlbum = fetchAlbum();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data.id.toString()),
                  Text(snapshot.data.title),
                  Text(snapshot.data.userId.toString()),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: new Text('Fetch'),
          onPressed: () {},
        ),
      ),
    );
  }
}
