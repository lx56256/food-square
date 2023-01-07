import 'package:flutter/material.dart';
import 'package:food_square/core/model/meal_model.dart';

import 'filter_view_model.dart';

class BaseViewModel extends ChangeNotifier {
  FilterViewModel _filterVM = FilterViewModel();
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals.where((element) {
      if (_filterVM.isGlutenFree && !element.isGlutenFree!) return false;
      if (_filterVM.isLactoseFree && !element.isLactoseFree!) return false;
      if (_filterVM.isVegetarian && !element.isVegetarian!) return false;
      if (_filterVM.isVegan && !element.isVegan!) return false;
      return true;
    }).toList();
  }

  List<MealModel> get originMeals {
    return _meals;
  }

  void updateFilters(FilterViewModel filterVm) {
    _filterVM = filterVm;
  }

  set meals(List<MealModel> meals) {
    _meals = meals;
  }
}
