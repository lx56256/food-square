import 'package:flutter/material.dart';
import 'package:food_square/ui/pages/favorite/index.dart';
import 'package:food_square/ui/pages/home/drawer.dart';
import 'package:food_square/ui/pages/home/index.dart';

class MainPage extends StatefulWidget {
  static final String routeName = '/';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          FavoritePage(),
        ],
      ),
      drawer: DrawerContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            label: '首页',
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '收藏',
            icon: Icon(
              Icons.star,
              size: 30,
            ),
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
