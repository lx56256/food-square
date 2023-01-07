import 'package:flutter/material.dart';
import 'package:food_square/core/model/meal_model.dart';
import 'package:food_square/core/view_model/favorite_view_model.dart';
import 'package:food_square/ui/pages/detail/index.dart';
import 'package:food_square/ui/widgets/operation.dart';
import 'package:provider/provider.dart';
import '../extension/int_extension/index.dart';

class MealItem extends StatelessWidget {
  final MealModel _meal;
  const MealItem(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          MealDetail.routeName,
          arguments: _meal,
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5.px,
        child: Column(
          children: [
            buildBaseInfo(context),
            buildOperationInfo(),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
      ),
    );
  }

  Widget buildBaseInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.px),
            topRight: Radius.circular(12.px),
          ),
          child: Image.network(
            _meal.imageUrl ?? '',
            // loadingBuilder: (context, child, loadingProgress) =>
            //     loadingProgress == null ? child : LinearProgressIndicator(),
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10.px,
          right: 10.px,
          child: Container(
            width: 300.px,
            // alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 5.px, vertical: 8.px),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(
              _meal.title ?? '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationItem(Icon(Icons.schedule), '${_meal.duration}分钟'),
          OperationItem(Icon(Icons.restaurant), _meal.complexStr ?? ''),
          buildFavoriteItem(),
        ],
      ),
    );
  }

  Widget buildFavoriteItem() {
    return Container(
      width: 100.px,
      child: Consumer<FavoriteViewModel>(builder: (ctx, vm, child) {
        final isFavorite = vm.isFavorite(_meal);
        final icons = isFavorite
            ? Icon(Icons.favorite, color: Colors.red)
            : Icon(Icons.favorite_outline);
        return GestureDetector(
            onTap: () {
              vm.handleMeal(_meal);
            },
            child: OperationItem(icons, isFavorite ? '已收藏' : '收藏'));
      }),
    );
  }
}
