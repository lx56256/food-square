import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_square/core/model/category_model.dart';
import 'package:food_square/core/model/meal_model.dart';
import 'package:food_square/core/view_model/meal_view_model.dart';
import 'package:food_square/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CateGoryItemModel;
    return Selector<MealViewModel, List<MealModel>>(
        builder: (ctx, meals, child) {
          if (meals.length == 0) {
            return Center(
              child: Text('暂无数据'),
            );
          }
          return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return MealItem(meals[index]);
              });
        },
        shouldRebuild: (previous, next) =>
            !ListEquality().equals(previous, next),
        selector: (ctx, vm) {
          return vm.meals
              .where(
                  (element) => (element.categories ?? []).contains(category.id))
              .toList();
        });
  }
}



// class DetailContent extends StatelessWidget {
//   const DetailContent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final category =
//         ModalRoute.of(context)?.settings.arguments as CateGoryItemModel;
//     return Consumer<MealViewModel>(builder: (ctx, vm, child) {
//       final meals = vm.meals
//           .where((element) => (element.categories ?? []).contains(category.id))
//           .toList();
//       return ListView.builder(
//           itemCount: meals.length,
//           itemBuilder: (ctx, index) {
//             return ListTile(
//               title: Text(meals[index].title ?? ''),
//             );
//           });
//     });
//   }
// }
