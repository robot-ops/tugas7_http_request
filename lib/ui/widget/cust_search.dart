import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  CustomSearch({Key? key, required this.labelText, required this.onChange})
      : super(key: key);
  String labelText;
  final ValueChanged<String> onChange;

  @override
  CustomSearchState createState() => CustomSearchState();
}

class CustomSearchState extends State<CustomSearch> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        border: Border.all(color: Colors.black38),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Input Here',
          prefixIcon: Icon(Icons.search),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: widget.onChange,
      ),
    );
  }
}
