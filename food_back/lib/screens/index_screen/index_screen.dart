import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../controller/index_screen_controller.dart';
import '../cart_screen/cart_screen.dart';
import '../favourite_screen/favourite_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../search_screen/search_screen.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: indexScreenController.controller,
        screens: _buildScreens(context),
        items: _navBarsItems(context),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).backgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {
          indexScreenController.testContext = context!;
        },
        hideNavigationBar: indexScreenController.hideNavBar.value,
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<Widget> _buildScreens(context) {
    return [
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: HomeScreen(
          onPressed: (val) {
            indexScreenController.hideNavBar.value = val;
          },
        ),
      ),
      //_hideNavBar = prm;
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SearchScreen(
          onPressed: (val) {
            indexScreenController.hideNavBar.value = val;
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CartScreen(
          onPressed: (val) {
            indexScreenController.hideNavBar.value = val;
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: FavouriteScreen(
          onPressed: (val) {
            indexScreenController.hideNavBar.value = val;
          },
        ),
      ),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ProfileScreen(
          onPressed: (val) {
            indexScreenController.hideNavBar.value = val;
          },
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
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
        icon: const Icon(CupertinoIcons.search),
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
        icon: const Icon(CupertinoIcons.cart),
        title: "Cart",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
        inactiveColorSecondary: Colors.purple,
        textStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 10, fontWeight: FontWeight.normal),
        iconSize: 24,
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart),
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
        icon: const Icon(CupertinoIcons.person_alt_circle),
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
