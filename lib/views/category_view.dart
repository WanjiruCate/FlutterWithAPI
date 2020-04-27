import 'package:flutter/material.dart';
import 'package:trial_http/models/category_for_listing.dart';
import 'package:trial_http/services/category_service.dart';
import 'package:trial_http/views/note_delete.dart';

class CategorList extends StatefulWidget {
  @override
  _CategorListState createState() => _CategorListState();
}

class _CategorListState extends State<CategorList> {
  List<Category> listcategories;

  bool isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/$dateTime.year}';
  }

  Future _fetchCategoryData() async {
    setState(() {
      isLoading = true;
    });

    listcategories = await getCategories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchCategoryData();
    print(listcategories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: listcategories.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: Colors.green,
              ),
              itemBuilder: (context, index) {
                Category category = listcategories[index];
                return Dismissible(
                  key: ValueKey(category.categoryId),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => NoteDelete());
                    print(result);
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      //TODO Implement onTap
                    },
                    title: Text(
                      //  'hello',
                      category.categoryName,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text('Last Edited on ${(category.createdAt)}'),
                  ),
                );
              },

              //itemCount: apiResponse.data.length,
            ),
    );
  }
}
