import 'package:flutter/material.dart';
import './content.dart';

class FilterPage extends StatelessWidget {
  static final String routeName = '/filter';
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过滤'),
      ),
      body: BodyContent(),
    );
  }
}
