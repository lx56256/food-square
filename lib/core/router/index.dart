import 'package:flutter/material.dart';
import 'package:food_square/ui/pages/detail/index.dart';
import 'package:food_square/ui/pages/filter/index.dart';
import 'package:food_square/ui/pages/meals/index.dart';
import 'package:food_square/ui/pages/main/index.dart';
import 'package:food_square/ui/pages/unknown/index.dart';

class RouterConfig {
  static final initialRoute = MainPage.routeName;
  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (ctx) => MainPage(),
    MealList.routeName: (ctx) => MealList(),
    MealDetail.routeName: (ctx) => MealDetail(),
  };

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == FilterPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return FilterPage();
          },
          fullscreenDialog: true);
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return UnknownPage();
    });
  };
}
