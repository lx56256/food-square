import 'package:flutter/material.dart';
import 'package:food_square/core/model/category_model.dart';

import 'content.dart';

class MealList extends StatelessWidget {
  static final routeName = '/meals';
  const MealList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CateGoryItemModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title ?? ''),
      ),
      body: DetailContent(),
    );
  }
}
