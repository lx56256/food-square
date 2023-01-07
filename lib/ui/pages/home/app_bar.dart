import 'package:flutter/material.dart';

class AppBarContent extends AppBar {
  AppBarContent(BuildContext context)
      : super(
          title: Text('美食广场'),
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        );
}
