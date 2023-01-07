import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_square/core/model/category_model.dart';
import 'package:food_square/core/model/meal_model.dart';

class JsonParse {
  static Future<List<CateGoryItemModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    final result = json.decode(jsonString);
    final items = result['category'];

    List<CateGoryItemModel> categories = [];
    for (var item in items) {
      categories.add(CateGoryItemModel.fromJson(item));
    }
    return categories;
  }

  static Future<List<MealModel>> getMealData() async {
    final jsonString = await rootBundle.loadString('assets/json/meal.json');
    final result = json.decode(jsonString);

    final items = result['meal'];
    List<MealModel> meals = [];
    for (var item in items) {
      meals.add(MealModel.fromJson(item));
    }
    return meals;
  }
}
