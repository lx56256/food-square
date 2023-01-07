import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'content.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContent(context),
      body: HomeContent(),
    );
  }
}
