import 'dart:ui';

class CateGoryItemModel {
  String? id;
  String? title;
  String? color;
  Color? finalColor;

  CateGoryItemModel({this.id, this.title, this.color});

  CateGoryItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    final colors = int.parse(json['color'], radix: 16);
    finalColor = Color(colors | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
