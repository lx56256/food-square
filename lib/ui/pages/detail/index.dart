import 'package:flutter/material.dart';
import 'package:food_square/core/model/meal_model.dart';
import 'package:food_square/core/view_model/favorite_view_model.dart';
import 'package:food_square/ui/pages/detail/content.dart';
import 'package:provider/provider.dart';

class MealDetail extends StatelessWidget {
  static final routeName = '/detail';
  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as MealModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title ?? ''),
        ),
        body: DetailContent(meal),
        floatingActionButton:
            Consumer<FavoriteViewModel>(builder: (ctx, vm, child) {
          final isFavorite = vm.isFavorite(meal);
          final icons = !isFavorite
              ? Icon(Icons.favorite_outline)
              : Icon(
                  Icons.favorite,
                  color: Colors.red,
                );
          return FloatingActionButton(
            onPressed: () {
              vm.handleMeal(meal);
            },
            child: icons,
          );
        }));
  }
}
