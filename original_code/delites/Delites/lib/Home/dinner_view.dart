// ignore_for_file: prefer_const_constructors, unused_element, prefer_typing_uninitialized_variables, unnecessary_null_comparison, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:like_button/like_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DinnerView extends StatefulWidget {
  final String image;
  final String? name;
  final String? time;
  final String? kcal;

  const DinnerView({
    Key? key,
    required this.image,
    this.name,
    this.time,
    this.kcal,
  }) : super(key: key);

  @override
  _DinnerViewState createState() => _DinnerViewState();
}

class _DinnerViewState extends State<DinnerView> {
  late ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          debugPrint("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          debugPrint("**** $_isVisible down");
        });
      }
    });
  }

  double _status = 4.0;
  double _width = double.infinity;
  double _height = 390;
  bool _folded = true;
  double _width1 = double.infinity;
  double _height1 = 55;
  bool _folded1 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: ListView(
            controller: _hideButtonController,
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Image.asset(widget.image,
                      height: 250, fit: BoxFit.cover, width: double.infinity),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        defaultPadding,
                        MediaQuery.of(context).padding.top + defaultPadding,
                        defaultPadding,
                        defaultPadding),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 120),
                          child: Row(
                            children: [
                              IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                  )),
                              Spacer(),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: LikeButton(
                                  size: 18,
                                  circleColor: CircleColor(
                                      start: Colors.red, end: Colors.red),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Colors.red,
                                    dotSecondaryColor: Colors.red,
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return !isLiked
                                        ? Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          );
                                  },
                                ),
                              ),
                              IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.more_horiz_sharp,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                color: Theme.of(context).backgroundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.name != null &&
                                              widget.name != ""
                                          ? widget.name!
                                          : "Fresh Salad Pasta"),
                                      SizedBox(height: defaultPadding),
                                      Text("Dinner of the day",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 90,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.watch_later_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          Text(
                                              widget.time != null &&
                                                      widget.time != ""
                                                  ? widget.time!
                                                  : '10 mins',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                        ],
                                      ),
                                      VerticalDivider(
                                          indent: 30,
                                          thickness: 1.4,
                                          endIndent: 30,
                                          color:
                                              Theme.of(context).dividerColor),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.corporate_fare_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          Text(
                                            '6 ingr',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                        ],
                                      ),
                                      VerticalDivider(
                                          indent: 30,
                                          thickness: 1.4,
                                          endIndent: 30,
                                          color:
                                              Theme.of(context).dividerColor),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.grain_rounded,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          Text('260 g',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                        ],
                                      ),
                                      VerticalDivider(
                                          indent: 30,
                                          thickness: 1.4,
                                          endIndent: 30,
                                          color:
                                              Theme.of(context).dividerColor),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.flash_on_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          Text(
                                              widget.kcal != null &&
                                                      widget.kcal != ""
                                                  ? widget.kcal!
                                                  : '268 kcal',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                color: Theme.of(context).backgroundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nutrition Information"),
                                      SizedBox(height: defaultPadding),
                                      Text("Per serving",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                    ],
                                  ),
                                ),
                                Center(
                                    child: Image.asset(ConstanceData.chart,
                                        height: 200)),
                                SizedBox(height: defaultPadding),
                                SizedBox(
                                  height: 90,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xff894dff),
                                                    radius: 7),
                                                SizedBox(width: defaultPadding),
                                                Text(
                                                  'Protein',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(fontSize: 17),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '27.0 g',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(
                                          indent: 20,
                                          thickness: 1.4,
                                          endIndent: 20,
                                          color:
                                              Theme.of(context).dividerColor),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xfffd9a2b),
                                                    radius: 7),
                                                SizedBox(width: defaultPadding),
                                                Text(
                                                  'Fat',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(fontSize: 17),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '19.0 g',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(
                                          indent: 20,
                                          thickness: 1.4,
                                          endIndent: 20,
                                          color:
                                              Theme.of(context).dividerColor),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xff60bb02),
                                                    radius: 7),
                                                SizedBox(width: defaultPadding),
                                                Text(
                                                  'Protein',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(fontSize: 17),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '6.0 g',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                color: Theme.of(context).backgroundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nutrition Quality"),
                                SizedBox(height: defaultPadding * 4),
                                Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        TooltipTheme(
                                          data: TooltipThemeData(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          child: SfSlider(
                                            min: 1,
                                            max: 5,
                                            interval: 4,
                                            stepSize: 1,
                                            tooltipShape:
                                                SfPaddleTooltipShape(),
                                            shouldAlwaysShowTooltip: true,
                                            inactiveColor:
                                                Theme.of(context).primaryColor,
                                            activeColor: Colors.grey[300],
                                            enableTooltip: true,
                                            value: _status,
                                            onChanged: (updateStatus) {
                                              setState(() => {
                                                    _status = updateStatus,
                                                  });
                                            },
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 18.5),
                                          child: Stack(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 1.0
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                              : Colors
                                                                  .grey[300],
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 1.0 ||
                                                                  _status == 2.0
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                              : Colors
                                                                  .grey[300],
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 1.0 ||
                                                                  _status ==
                                                                      2.0 ||
                                                                  _status == 3.0
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                              : Colors
                                                                  .grey[300],
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 1.0 ||
                                                                  _status ==
                                                                      2.0 ||
                                                                  _status ==
                                                                      3.0 ||
                                                                  _status == 4.0
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                              : Colors
                                                                  .grey[300],
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                      radius: 6),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 1.0
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 2.0
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 3.0
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 4.0
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      radius: 6),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          _status == 5.0
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent,
                                                      radius: 6),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: defaultPadding + 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "A",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: _status == 1.0
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.grey),
                                          ),
                                          Text(
                                            "B",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: _status == 2.0
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.grey),
                                          ),
                                          Text(
                                            "C",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: _status == 3.0
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.grey),
                                          ),
                                          Text(
                                            "D",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: _status == 4.0
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.grey),
                                          ),
                                          Text(
                                            "E",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: _status == 5.0
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding),
                                    Text(
                                        "Healthy if taken in moderation. Nutrition-packerd but also contains trans fats,saturated fats, saturated fats, sugar, ...",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _height = 390;
                              _folded = true;
                              _width = double.infinity;
                            });
                          },
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: AnimatedContainer(
                              curve: Curves.ease,
                              padding: EdgeInsets.all(defaultPadding),
                              duration: Duration(milliseconds: 300),
                              width: _width,
                              height: _height,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius * 2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _folded
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _height = 55;
                                                  _width = double.infinity;
                                                  _folded = false;
                                                });
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Text("Ingredients"),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: Colors.grey[400],
                                                    size: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: defaultPadding),
                                            Column(
                                              children: [
                                                ingredientsRow(
                                                    infoTxt: '100.0 g',
                                                    txt: 'Singapore noodles'),
                                                Divider(
                                                    height: defaultPadding * 2),
                                                ingredientsRow(
                                                    infoTxt: '20.0 g',
                                                    txt: 'Zuchini'),
                                                Divider(
                                                    height: defaultPadding * 2),
                                                ingredientsRow(
                                                    infoTxt: '20.0 g',
                                                    txt: 'Tomato'),
                                                Divider(
                                                    height: defaultPadding * 2),
                                                ingredientsRow(
                                                    infoTxt: '10.0 g',
                                                    txt: 'Chili'),
                                                Divider(
                                                    height: defaultPadding * 2),
                                                ingredientsRow(
                                                    infoTxt: '2', txt: 'Eggs'),
                                                Divider(
                                                    height: defaultPadding * 2),
                                                ingredientsRow(
                                                    infoTxt: '20.0 g',
                                                    txt: 'Cheese'),
                                                Divider(
                                                    height: defaultPadding * 2),
                                                ingredientsRow(
                                                    infoTxt: '10.0 g',
                                                    txt: 'Basli'),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text("Ingredients"),
                                            Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Colors.grey[400],
                                              size: 25,
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _height1 = 210;
                              _folded1 = true;
                              _width1 = double.infinity;
                            });
                          },
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: AnimatedContainer(
                              curve: Curves.ease,
                              padding: EdgeInsets.all(defaultPadding),
                              duration: Duration(milliseconds: 300),
                              width: _width1,
                              height: _height1,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius * 2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _folded1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _height1 = 55;
                                                  _width1 = double.infinity;
                                                  _folded1 = false;
                                                });
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("How To Make"),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: Colors.grey[400],
                                                    size: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: defaultPadding),
                                            Column(
                                              children: [
                                                makeRow(txt: 'Boli the kettle'),
                                                SizedBox(
                                                    height: defaultPadding - 6),
                                                makeRow(
                                                    txt:
                                                        'Pour boling water over fresh hokkien or similar noodles'),
                                                SizedBox(
                                                    height: defaultPadding - 6),
                                                makeRow(
                                                    txt:
                                                        'Stand for 2 minutes or a bit longer'),
                                                SizedBox(
                                                    height: defaultPadding - 6),
                                                makeRow(
                                                    txt:
                                                        'Drain & sauce like your favorite pasta'),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("How To Make"),
                                            Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              size: 25,
                                              color: Colors.grey[400],
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height:
                _isVisible ? MediaQuery.of(context).padding.bottom + 60.0 : 0.0,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(defaultRadius)),
            ),
            child: bottomNavigationBar(),
          )
        ])
      ],
    );
  }

//   String _emojify() {
//     switch (_status.floor()) {
//       case 0:
//         return "👍";
//       case 1:
//         return "💪";
//       case 2:
//         return "🤘";
//       case 3:
//         return "👌";
//       case 4:
//         return "👎";
//     }
//     return '';
//   }

  Widget bottomNavigationBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          defaultPadding,
          defaultPadding,
          defaultPadding,
          MediaQuery.of(context).padding.bottom + defaultPadding),
      decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8.0,
            ),
          ],
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(defaultRadius)),
          color: Theme.of(context).backgroundColor),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: LikeButton(
              size: 28,
              circleColor: CircleColor(start: Colors.red, end: Colors.red),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Colors.red,
                dotSecondaryColor: Colors.red,
              ),
              likeBuilder: (bool isLiked) {
                return !isLiked
                    ? Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey,
                        size: 27,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 27,
                      );
              },
            ),
          ),
          Flexible(
            child: CustomButton(
              miniRadius: true,
              height: 50,
              text: 'Add to Cart',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Row ingredientsRow({required String txt, required String infoTxt}) {
    return Row(
      children: [
        Text("●", style: TextStyle(color: Colors.grey[300])),
        SizedBox(width: defaultPadding),
        Text(txt, style: Theme.of(context).textTheme.subtitle1),
        Spacer(),
        Text(infoTxt, style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }

  Row makeRow({required String txt}) {
    return Row(
      children: [
        Text("●", style: TextStyle(color: Colors.grey[300])),
        SizedBox(width: defaultPadding),
        Flexible(
          child: Text(
            txt,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
