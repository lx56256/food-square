import 'package:flutter/material.dart';
import 'package:food_square/core/view_model/favorite_view_model.dart';
import 'package:food_square/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(builder: (ctx, vm, child) {
      if (vm.meals.length == 0) {
        return Center(
          child: Text('暂无数据'),
        );
      }
      return ListView.builder(
          itemCount: vm.meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(vm.meals[index]);
          });
    });
  }
}
