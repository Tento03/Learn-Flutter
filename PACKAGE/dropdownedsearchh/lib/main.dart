import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() {
  runApp(MaterialApp(home: DropDownExample()));
}

class DropDownExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown Search")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DropdownSearch<String>(
          items: (f, cs) => ["Item 1", 'Item 2', 'Item 3', 'Item 4'],
          popupProps: PopupProps.menu(fit: FlexFit.loose),
        ),
      ),
    );
  }
}
