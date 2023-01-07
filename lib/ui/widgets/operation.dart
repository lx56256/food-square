import 'package:flutter/material.dart';
import '../extension/int_extension/index.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  const OperationItem(this._icon, this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 90.px,
      padding: EdgeInsets.all(8.px),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 6.px),
          Text(_title, style: Theme.of(context).textTheme.headline3)
        ],
      ),
    );
  }
}
