import 'package:flutter/material.dart';
import 'package:trial_http/models/category_for_listing.dart';
import 'package:trial_http/services/dio_trial.dart';

class CategoryViewDropTwo extends StatefulWidget {
  @override
  _CategoryViewDropTwoState createState() => _CategoryViewDropTwoState();
}

class _CategoryViewDropTwoState extends State<CategoryViewDropTwo> {
  List<Category> categories;

  List<DropdownMenuItem<Category>> dropdownMenuItems;

  bool isLoading = false;

  Future _fetchCategories() async {
    setState(() {
      isLoading = true;
    });
    categories = await getCategories();
    dropdownMenuItems = buildDropDownMenuItems(categories);
    _selectedCategory = dropdownMenuItems[0].value;
    setState(() {
      isLoading = false;
    });
  }

  Category _selectedCategory;

  @override
  void initState() {
    _fetchCategories();

    super.initState();
  }

  List<DropdownMenuItem<Category>> buildDropDownMenuItems(List categories) {
    List<DropdownMenuItem<Category>> items = List();

    for (Category category in categories) {
      items.add(DropdownMenuItem(
        value: category,
        child: Text(category.categoryName),
      ));
    }
    return items;
  }

  onChangedDropdownItem(Category selectedCategory) {
    setState(() {
      _selectedCategory = selectedCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Select Category'),
                  SizedBox(height: 20.0),
                  DropdownButton(
                    items: dropdownMenuItems,
                    onChanged: onChangedDropdownItem,
                    value: _selectedCategory,
                  ),
                  SizedBox(height: 20.0),
                  Text('Selected Company: ${_selectedCategory.categoryName}')
                ],
              ),
            ),
    );
  }
}
