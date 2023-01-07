import 'package:flutter/material.dart';
import 'package:food_square/ui/pages/filter/index.dart';
import '../../extension/int_extension/index.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeader(context),
            buildListTail(context, Icon(Icons.restaurant), '进餐', () {
              Navigator.of(context).pop();
            }),
            buildListTail(context, Icon(Icons.settings), '过滤', () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(FilterPage.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: 120.px,
      margin: EdgeInsets.only(bottom: 8.px),
      alignment: Alignment(0, 0.5),
      color: Colors.amber,
      child: Text(
        '开始动手',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListTail(BuildContext context, Widget icons, String title,
      void Function() handle) {
    return ListTile(
      onTap: handle,
      leading: icons,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
