// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/widget/favourite_cart_box.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key, this.onPressed}) : super(key: key);
  final void Function(bool)? onPressed;

  @override
  _TavViewState createState() => _TavViewState();
}

class _TavViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                  bottom: defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.keyboard_backspace_rounded)),
                  Text(
                    "Fruits",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search)),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                  bottom:
                      MediaQuery.of(context).padding.bottom + defaultPadding),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              children: [
                FavouriteCartBox(
                  color: Color(0xfff66b54),
                  img: ConstanceData.strawberry,
                  itemName: "Strawberry",
                  price: '\$2.5',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xffbbaf01),
                  img: ConstanceData.starfruit,
                  itemName: "Star Fruit",
                  price: '\$4.5',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xffffef5b),
                  img: ConstanceData.pineapple,
                  itemName: "Pine Apple",
                  price: '\$1.5',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xff60b94b),
                  img: ConstanceData.pear,
                  itemName: "Pear",
                  price: '\$2.5',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xff5a2328),
                  img: ConstanceData.redDragonFruit,
                  itemName: "Red Dragon Fruit",
                  price: '\$2',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xfff86716),
                  img: ConstanceData.papaya,
                  itemName: "Papaya",
                  price: '\$2',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xff523a12),
                  img: ConstanceData.gastroObscura,
                  itemName: "GastroObscura",
                  price: '\$4.7',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
                FavouriteCartBox(
                  color: Color(0xff3e6007),
                  img: ConstanceData.thaiGuava,
                  itemName: "Thai Guava",
                  price: '\$5.5',
                  quntityText: "Price Per Kg",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
