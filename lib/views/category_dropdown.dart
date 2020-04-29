import 'package:flutter/material.dart';
import 'package:trial_http/models/category_for_listing.dart';
import 'package:trial_http/services/category_service_get.dart';

class CategoryDropDownView extends StatefulWidget {
  @override
  _CategoryDropDownViewState createState() => _CategoryDropDownViewState();
}

class _CategoryDropDownViewState extends State<CategoryDropDownView> {
  List<Category> listGetCategories;

  bool isLoading = false;

  Future _fetchCategories() async {
    setState(() {
      isLoading = true;
    });
    listGetCategories = await getCategories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category DropDown'),
        centerTitle: true,
      ),
      body: new DropDownCategory(),
    );
  }
}

class DropDownCategory extends StatefulWidget {
  @override
  _DropDownCategoryState createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
  List<Category> getListCategories;

  bool isLoading = false;

  Future _fetchCategories() async {
    setState(() {
      isLoading = true;
    });
    getListCategories = await getCategories();
    _dropDownMenuItems = buildDropdownMenuItems(getListCategories);
    _selectedCategory = _dropDownMenuItems[0].value;
    setState(() {
      isLoading = false;
    });
  }

  List<DropdownMenuItem<Category>> _dropDownMenuItems;
  Category _selectedCategory;
  @override
  void initState() {
    _fetchCategories();

    super.initState();
  }

  List<DropdownMenuItem<Category>> buildDropdownMenuItems(List categories) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(category.categoryName),
        ),
      );
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
    return Center(
      child: Column(
        children: <Widget>[
          Text('Select a Category'),
          SizedBox(height: 20.0),
          DropdownButton(
            items: _dropDownMenuItems,
            value: _selectedCategory,
            onChanged: onChangedDropdownItem,
          ),
          SizedBox(height: 20.0),
          Text("Selected :${_selectedCategory.categoryName}")
        ],
      ),
      // child: DropdownButton<String>(
      //   value: dropDownvalue,
      //   icon: Icon(Icons.arrow_downward),
      //   iconSize: 24,
      //   elevation: 16,
      //   style: TextStyle(color: Colors.deepPurple),
      //   underline: Container(
      //     height: 2,
      //     color: Colors.deepPurpleAccent,
      //   ),
      //   onChanged: (String newvalue) {
      //     setState(() {
      //       dropDownvalue = newvalue;
      //     });
      //   },
      //   items: <String>['One', 'Two', 'Three']
      //       .map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       child: Text(value),
      //       value: value,
      //     );
      //   }).toList(),
      // ),
    );
  }
}
