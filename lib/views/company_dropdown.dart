import 'package:flutter/material.dart';
import 'package:trial_http/models/company.dart';

class CompanyDropDown extends StatefulWidget {
  @override
  _CompanyDropDownState createState() => _CompanyDropDownState();
}

class _CompanyDropDownState extends State<CompanyDropDown> {
  List<Company> companies = Company.getCompanyList();
  List<DropdownMenuItem<Company>> dropdownMenuItems;

  Company _selectedComapany;

  @override
  void initState() {
    dropdownMenuItems = buildDropDownMenuItems(companies);
    _selectedComapany = dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropDownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();

    for (Company company in companies) {
      items.add(DropdownMenuItem(
        value: company,
        child: Text(company.name),
      ));
    }
    return items;
  }

  onChangedDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedComapany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Select Company'),
            SizedBox(height: 20.0),
            DropdownButton(
              items: dropdownMenuItems,
              onChanged: onChangedDropdownItem,
              value: _selectedComapany,
            ),
            SizedBox(height: 20.0),
            Text('Selected Company: ${_selectedComapany.name}')
          ],
        ),
      ),
    );
  }
}
