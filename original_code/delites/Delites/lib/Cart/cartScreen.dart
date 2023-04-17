// ignore_for_file: file_names, prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Cart/checkout_screen.dart';
import 'package:delites/Constance/constance.dart';
import 'package:delites/Constance/theme.dart';
import 'package:delites/Home/item_view.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final void Function(bool)? onPressed;
  const CartScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int i = 1;
  int i2 = 2;
  int i3 = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 14,
                  left: 14,
                  right: 14,
                  bottom: 8),
              child: Row(
                children: [
                  Text(
                    "Cart",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(14),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Single Items",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 17,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onPressed!(true);
                              setState(() {});
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemView(
                                    "\$6.8",
                                    image: ConstanceData.home3image2,
                                    itemName: "Dhosa",
                                  ),
                                ),
                              ).then((value) {
                                widget.onPressed!(false);
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                ConstanceData.home3image2,
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dhosa",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "\$6.8",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15, color: primacolor),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
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
                                      if (i > 0) {
                                        i--;
                                      }
                                    });
                                  },
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(i.toString()),
                              SizedBox(
                                width: 15,
                              ),
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
                                      i++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onPressed!(true);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemView(
                                    "\$14.2",
                                    image: ConstanceData.fruits,
                                    itemName: "Banana(5 items)",
                                    bgColor: HexColor("#ffef5b"),
                                  ),
                                ),
                              ).then((value) {
                                widget.onPressed!(false);
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                color: HexColor("#ffef5b"),
                                child: Image.asset(
                                  ConstanceData.fruits,
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Banana(5 items)",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "\$14.2",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15, color: primacolor),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
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
                                      if (i2 > 1) {
                                        i2--;
                                      }
                                    });
                                  },
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(i2.toString()),
                              SizedBox(
                                width: 15,
                              ),
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
                                      i2++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Fresh Salad Pasta",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 17,
                                    ),
                          ),
                          Expanded(child: SizedBox()),
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
                                  if (i3 > 1) {
                                    i3--;
                                  }
                                });
                              },
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(i3.toString()),
                          SizedBox(
                            width: 15,
                          ),
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
                                  i3++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onPressed!(true);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemView(
                                    "\$10.0",
                                    image: ConstanceData.healthy,
                                    itemName: "Healthy Food for Health",
                                    bgColor: HexColor("#d8e697"),
                                  ),
                                ),
                              ).then((value) {
                                widget.onPressed!(false);
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                color: HexColor("#d8e697"),
                                child: Image.asset(
                                  ConstanceData.healthy,
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Healthy Food for Health",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "\$10.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15, color: primacolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onPressed!(true);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemView(
                                    "\$10.0",
                                    image: ConstanceData.home3image4,
                                    itemName: "Fruits",
                                  ),
                                ),
                              ).then((value) {
                                widget.onPressed!(false);
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                ConstanceData.home3image4,
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fruits",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "\$10.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15, color: primacolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              widget.onPressed!(true);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemView(
                                    "\$3.7",
                                    image: ConstanceData.vegetable,
                                    itemName: "vegetable",
                                    bgColor: HexColor("#714921"),
                                  ),
                                ),
                              ).then((value) {
                                widget.onPressed!(false);
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                color: HexColor("#714921"),
                                child: Image.asset(
                                  ConstanceData.vegetable,
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "vegetable",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "\$3.7",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15, color: primacolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          defaultRadius)))),
                      onPressed: () async {
                        widget.onPressed!(true);
                        setState(() {});
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutScreen(),
                          ),
                        ).then((value) {
                          widget.onPressed!(false);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$56.78 ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                          Expanded(child: SizedBox()),
                          Row(
                            children: [
                              Text(
                                "Check Out",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 60)
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultRadius)))),
            onPressed: () async {
              widget.onPressed!(true);
              setState(() {});
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(),
                ),
              ).then((value) {
                widget.onPressed!(false);
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$56.78 ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Text(
                      "Check Out",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ),
                SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
