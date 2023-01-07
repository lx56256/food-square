import 'package:flutter/material.dart';
import 'package:food_square/core/model/category_model.dart';
import 'package:food_square/core/service/json_parse.dart';
import '../../extension/int_extension/index.dart';
import 'item.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<CateGoryItemModel> _categories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    JsonParse.getCategoryData().then((value) {
      setState(() {
        _categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20.rpx),
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.rpx,
            crossAxisSpacing: 20.rpx,
            childAspectRatio: 1.5),
        itemBuilder: (ctx, index) {
          return CardItem(_categories[index]);
        });
  }
}

// 适合一次加载数据
// class HomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<CateGoryItemModel>>(
//       future: JsonParse.getCategoryData(),
//       builder: (ctx, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('请求出错'),
//           );
//         }
//         final categories = snapshot.data;
//         return GridView.builder(
//             padding: EdgeInsets.all(20.rpx),
//             itemCount: categories?.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 20.rpx,
//                 crossAxisSpacing: 20.rpx,
//                 childAspectRatio: 1.5),
//             itemBuilder: (ctx, index) {
//               return CardItem(categories![index]);
//             });
//       },
//     );
//   }
// }
