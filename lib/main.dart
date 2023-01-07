import 'package:flutter/material.dart';
import 'package:food_square/core/router/index.dart';
import 'package:food_square/core/view_model/favorite_view_model.dart';
import 'package:food_square/core/view_model/filter_view_model.dart';
import 'package:food_square/core/view_model/meal_view_model.dart';
import 'package:food_square/ui/extension/size_fit.dart';
import 'package:food_square/ui/shared/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => FilterViewModel(),
      ),
      ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
          create: (ctx) => MealViewModel(),
          update: (ctx, filterVm, mealVm) {
            mealVm!.updateFilters(filterVm);
            return mealVm;
          }),
      ChangeNotifierProxyProvider<FilterViewModel, FavoriteViewModel>(
          create: (ctx) => FavoriteViewModel(),
          update: (ctx, filterVm, favoriteVm) {
            favoriteVm!.updateFilters(filterVm);
            return favoriteVm;
          }),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    return MaterialApp(
      theme: ThemeConfig.themDate,
      darkTheme: ThemeConfig.dartTheme,
      routes: RouterConfig.routes,
      onGenerateRoute: RouterConfig.generateRoute,
      onUnknownRoute: RouterConfig.unknownRoute,
      initialRoute: RouterConfig.initialRoute,
    );
  }
}
