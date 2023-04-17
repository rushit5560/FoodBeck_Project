// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_typing_uninitialized_variables, unrelated_type_equality_checks, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/Constance/theme.dart';
import 'package:delites/widget/common_button.dart';
import 'package:delites/widget/favourite_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:like_button/like_button.dart';

class ItemView extends StatefulWidget {
  final String itemName;
  final String image;
  final String price;
  final Color? bgColor;
  const ItemView(
    this.price, {
    Key? key,
    this.bgColor,
    required this.image,
    required this.itemName,
  }) : super(key: key);

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  int _productCounter = 1;

  late ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: CustomScrollView(
            controller: _hideButtonController,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 230,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      decoration: BoxDecoration(color: widget.bgColor),
                      child: Center(
                          child: Hero(
                        tag: widget.itemName,
                        child: Image.asset(
                          widget.image,
                          fit: widget.bgColor != null && widget.bgColor != ""
                              ? BoxFit.fill
                              : BoxFit.cover,
                          height: widget.bgColor != null && widget.bgColor != ""
                              ? 155
                              : double.infinity,
                          width: widget.bgColor != null && widget.bgColor != ""
                              ? null
                              : MediaQuery.of(context).size.width,
                        ),
                      )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                          defaultPadding,
                          0,
                          defaultPadding,
                          MediaQuery.of(context).padding.bottom +
                              defaultPadding),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.itemName),
                          SizedBox(height: defaultPadding - 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.price,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 16,
                                          color: primacolor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "\$7.5",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                child: Text("FREE SHIP",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 12, color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.sentiment_satisfied_alt_outlined,
                                        color: Theme.of(context).primaryColor),
                                    SizedBox(width: 8),
                                    Text("Safe")
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.document_scanner_outlined,
                                        color: Theme.of(context).primaryColor),
                                    SizedBox(width: 8),
                                    Text("Safe")
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit,
                                        color: Theme.of(context).primaryColor),
                                    SizedBox(width: 8),
                                    Text("Safe")
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: defaultPadding),
                          RichText(
                            text: TextSpan(
                              text:
                                  'Everybody enjoys indulging in juicy red cherries during the summer season. This vibrant red ftuit is a great blend of sweer flavours with a tingle of sourness and adds the ... ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 13, color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'View More',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .primaryColor)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: defaultPadding),
                                  child: LikeButton(
                                    size: 28,
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
                                    height: 38,
                                    text: 'Add to Cart',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: favourite(ConstanceData.gastroObscura,
                                      "Olive Salad",
                                      color: HexColor("#523a12"),
                                      context: context)),
                              SizedBox(width: 7),
                              Expanded(
                                  child: favourite(
                                      ConstanceData.thaiGuava, "Dettol",
                                      color: HexColor("#3e6007"),
                                      quntityText: "300 ml",
                                      context: context)),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Expanded(
                                  child: favourite(
                                      ConstanceData.redDragonFruit, "Orio",
                                      color: HexColor("#5a2328"),
                                      quntityText: "1 pkt",
                                      context: context)),
                              SizedBox(width: 7),
                              Expanded(
                                  child: favourite(
                                      ConstanceData.papaya, "Red Radicchio",
                                      color: HexColor("#f86716"),
                                      context: context)),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Expanded(
                                  child: favourite(ConstanceData.pineapple,
                                      "Banana (5 items)",
                                      color: HexColor("#ffef5b"),
                                      context: context)),
                              SizedBox(width: 7),
                              Expanded(
                                  child: favourite(
                                      ConstanceData.pear, "Khandvi",
                                      color: Color(0xff60b94b),
                                      context: context)),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Expanded(
                                  child: favourite(
                                      ConstanceData.strawberry, "Veg Sendwich",
                                      quntityText: "1 Plate",
                                      color: Colors.red,
                                      context: context)),
                              SizedBox(width: 7),
                              Expanded(
                                  child: favourite(
                                      ConstanceData.starfruit, "Vda Pav",
                                      quntityText: "2 pcs",
                                      color: Color(0xffbbaf01),
                                      context: context)),
                            ],
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
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height:
                _isVisible ? MediaQuery.of(context).padding.bottom + 60.0 : 0.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: bottomNavigationBar(),
          ),
        ]),
      ],
    );
  }

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
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          color: Theme.of(context).backgroundColor),
      child: SizedBox(
        height: 55,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            )),
            // shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              // isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // controller: controller,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: defaultPadding,
                              horizontal: defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close)),
                              Text('Add new Items',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                        Divider(
                            thickness: 0.8,
                            height: 0,
                            color: Theme.of(context).dividerColor),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: defaultPadding * 2,
                              horizontal: defaultPadding),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 65,
                                decoration: BoxDecoration(
                                  color: widget.bgColor,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius - 5),
                                  image: DecorationImage(
                                    image: AssetImage(widget.image),
                                    fit: widget.bgColor != null &&
                                            widget.bgColor != ""
                                        ? BoxFit.cover
                                        : BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: defaultPadding),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.itemName),
                                    SizedBox(height: defaultPadding - 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Price per kg",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.grey),
                                        ),
                                        Text(
                                          widget.price,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                            thickness: 0.8,
                            endIndent: defaultPadding,
                            indent: defaultPadding,
                            height: 0,
                            color: Theme.of(context).dividerColor),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding * 2,
                            horizontal: defaultPadding,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [Text("Amount"), Text("\$11.2")],
                              ),
                              SizedBox(height: defaultPadding),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$11.2",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                            thickness: 0.8,
                            endIndent: defaultPadding,
                            indent: defaultPadding,
                            height: 0,
                            color: Theme.of(context).dividerColor),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              defaultPadding,
                              defaultPadding,
                              defaultPadding,
                              MediaQuery.of(context).padding.bottom + 15),
                          child: Row(
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.3,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (_productCounter > 1) {
                                              _productCounter--;
                                            }
                                          });
                                        },
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text('$_productCounter'),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.3,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                        color: Colors.green,
                                        onPressed: () {
                                          setState(() {
                                            _productCounter++;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: defaultPadding),
                              Flexible(
                                flex: 2,
                                child: CustomButton(
                                  height: 40,
                                  miniRadius: true,
                                  text: 'Add to Cart',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$11.2",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 15, color: Colors.white),
              ),
              Row(
                children: [
                  Text("Check Out",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 15, color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_rounded, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
