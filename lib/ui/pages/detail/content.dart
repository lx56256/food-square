import 'package:flutter/material.dart';
import 'package:food_square/core/model/meal_model.dart';
import 'package:food_square/ui/extension/size_fit.dart';
import '../../extension/int_extension/index.dart';

class DetailContent extends StatelessWidget {
  final MealModel _meal;
  DetailContent(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(bottom: SizeFit.getBottomBarHeight()),
      child: Column(
        children: [
          buildImageBanner(),
          buildMakTitle(context, '制作材料'),
          buildMakMaterial(context),
          buildMakTitle(context, '步骤'),
          buildSteps(context),
        ],
      ),
    ));
  }

  Widget buildImageBanner() {
    return Image.network(_meal.imageUrl ?? '');
  }

  Widget buildSteps(BuildContext context) {
    return buildListContent(
      context: context,
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.red, child: Text('#${index + 1}')),
              title: Text((_meal.steps ?? [])[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: (_meal.steps ?? []).length),
    );
  }

  Widget buildMakMaterial(BuildContext context) {
    return buildListContent(
        context: context,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (_meal.categories ?? []).length,
            itemBuilder: (ctx, index) {
              return Card(
                // elevation: 5.px,
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.all(6.px),
                  child: Text((_meal.ingredients ?? [])[index]),
                ),
              );
            }));
  }

  Widget buildMakTitle(BuildContext context, String title) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.px),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ));
  }

  Widget buildListContent(
      {required BuildContext context, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(10.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
