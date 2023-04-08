import 'package:flutter/material.dart';

import 'basket_screen.dart';
import 'package:marketapp/screens/declaration.dart';
import 'package:marketapp/screens/home.dart';
import 'package:marketapp/screens/profile.dart';
import 'package:marketapp/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  PageController _pageController = PageController();
  int _page = 0;
  List pages = [
    const Home(),
    const Search(),
    const BasketPage(),
    const Declaration(),
    const Profile(),
  ];
  List icons = [
    Icons.home,
    Icons.search,
    Icons.shopping_basket,
    Icons.wallet_giftcard_outlined,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) => pages[index]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(3),
            buildTabIcon(4),
          ],
        ),
        color: Theme.of(context).bottomAppBarColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(
          Icons.shopping_basket,
        ),
        onPressed: () => _pageController.jumpToPage(2),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  buildTabIcon(int index) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).accentColor
            : Theme.of(context).focusColor,
        onPressed: () => _pageController.jumpToPage(index),
      ),
    );
  }
}
