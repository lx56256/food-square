import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  static const routeName = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('没有找到')),
      body: Center(child: Text('没有找到页面')),
    );
  }
}
