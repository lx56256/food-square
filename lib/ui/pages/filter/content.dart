import 'package:flutter/material.dart';
import 'package:food_square/core/view_model/filter_view_model.dart';
import 'package:provider/provider.dart';
import '../../extension/int_extension/index.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        buildListTail(context),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.px),
      alignment: Alignment.center,
      child: Text(
        '展示选择',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildListTail(BuildContext context) {
    return Expanded(
      child: Consumer<FilterViewModel>(builder: (ctx, vm, child) {
        return ListView(
          children: [
            buildChoiceItem(context, '无谷蛋白', '无谷蛋白', vm.isGlutenFree, (value) {
              vm.isGlutenFree = value;
            }),
            buildChoiceItem(context, '不含乳糖', '不含乳糖', vm.isLactoseFree, (value) {
              vm.isLactoseFree = value;
            }),
            buildChoiceItem(context, '普通素食主义', '普通素食主义', vm.isVegetarian,
                (value) {
              vm.isVegetarian = value;
            }),
            buildChoiceItem(context, '严格素食主义', '严格素食主义', vm.isVegan, (value) {
              vm.isVegan = value;
            }),
          ],
        );
      }),
    );
  }

  Widget buildChoiceItem(BuildContext context, String title, String subtitle,
      bool value, void Function(bool) onChange) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: Text(subtitle),
      trailing: Switch(onChanged: onChange, value: value),
    );
  }
}
