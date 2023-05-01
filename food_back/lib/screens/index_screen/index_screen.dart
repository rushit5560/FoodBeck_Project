import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_modules/custom_loader.dart';
import '../../controller/index_screen_controller.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Obx(
            () => indexScreenController.isLoading.value
            ? const CustomLoader()
            : IndexedStack(
          index: indexScreenController.selectedIndex.value,
          children: indexScreenController.screen,
        ),
      ),


      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).disabledColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            //indexScreenController.homeScreenShow.value = false;
            indexScreenController.changeIndex(index);
          },
          currentIndex: indexScreenController.selectedIndex.value,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 24),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search, size: 24),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart, size: 24),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt_circle, size: 24),
              label: "Profile",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.heart, size: 24),
            //   label: "Favorites",
            // ),
          ],
        ),
      ),
    );
  }

  /*List<Widget> _buildScreens(context) {
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
  }*/

  /*List<PersistentBottomNavBarItem> _navBarsItems(context) {
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
  }*/
}
