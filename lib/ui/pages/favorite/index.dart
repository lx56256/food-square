import 'package:flutter/material.dart';
import 'content.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('我的收藏')), body: FavoriteContent());
  }
}
