import 'package:flutter/material.dart';
import 'package:trial_http/models/category_for_listing.dart';
import 'package:trial_http/services/category_post.dart';

class CategoryPost extends StatefulWidget {
  @override
  _CategoryPostState createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {
  Future<List<Category>> _categoryPost;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Categories'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter Category Type'),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              setState(() {
                _categoryPost = createCategory(_controller.text);
              });
            },
          )
        ],
      )),
    );
  }
}
