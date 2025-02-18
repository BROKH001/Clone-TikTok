import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          elevation: WidgetStatePropertyAll(0),
          hintText: "Search ..",
          autoFocus: true,
          shape: WidgetStatePropertyAll(StadiumBorder()),
        ),
      ),
      body: Center(
        child: Text(
          "Search ..",
        ),
      ),
    );
  }
}
