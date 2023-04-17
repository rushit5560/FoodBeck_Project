// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, use_key_in_widget_constructors, prefer_const_declarations, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:delites/Cart/cartScreen.dart';
import 'package:delites/Favourite/favourite_screen.dart';
import 'package:delites/Home/tab_screen.dart';
import 'package:delites/main.dart';
import 'package:delites/profile/profile_screen.dart';
import 'package:delites/search/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int light = 2;
  int dark = 1;

  late BuildContext testContext;

  changeColor(BuildContext context, int color) {
    if (color == light) {
      MyApp.setCustomeTheme(context, 6);
    } else {
      MyApp.setCustomeTheme(context, 7);
    }
  }

  PersistentTabController? _controller;
  bool _hideNavBar = false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).backgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {
          testContext = context!;
        },
        hideNavigationBar: _hideNavBar,
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Tab1(
          onPressed: (prm) {
            setState(() {
              _hideNavBar = prm;
            });
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SearchScreen(
          onPressed: (prm) {
            setState(() {
              _hideNavBar = prm;
            });
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CartScreen(
          onPressed: (prm) {
            setState(() {
              _hideNavBar = prm;
            });
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: FavouriteScreen(
          onPressed: (prm) {
            setState(() {
              _hideNavBar = prm;
            });
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ProfileScreen(
          onPressed: (prm) {
            setState(() {
              _hideNavBar = prm;
            });
          },
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.book),
        title: "Recipes",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
        inactiveColorSecondary: Colors.purple,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
        iconSize: 24,
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        title: "Search",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
        inactiveColorSecondary: Colors.purple,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
        iconSize: 24,
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: "Cart",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
        inactiveColorSecondary: Colors.purple,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10, fontWeight: FontWeight.normal),
        iconSize: 24,
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: "Favorites",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
        inactiveColorSecondary: Colors.purple,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
        iconSize: 24,
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_alt_circle),
        title: "Profile",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
        inactiveColorSecondary: Colors.purple,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
        iconSize: 24,
        contentPadding: 10,
      ),
    ];
  }
}
