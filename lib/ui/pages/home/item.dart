import 'package:flutter/material.dart';
import 'package:food_square/core/model/category_model.dart';
import 'package:food_square/ui/pages/meals/index.dart';
import '../../extension/int_extension/index.dart';

class CardItem extends StatelessWidget {
  final CateGoryItemModel _category;
  CardItem(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.finalColor;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealList.routeName, arguments: _category);
      },
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            gradient:
                LinearGradient(colors: [bgColor!.withOpacity(0.5), bgColor]),
            borderRadius: BorderRadius.circular(20.rpx),
          ),
          child: Text(
            '${_category.title}',
            style: Theme.of(context).textTheme.headline4,
          )),
    );
  }
}
