// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/profile/Account_information.dart';
import 'package:delites/profile/myorder.dart';
import 'package:delites/profile/payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  final void Function(bool)? onPressed;

  const ProfileScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(ConstanceData.profile),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Todde Benson",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 17,
                          ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "toddebenson@gmail.com",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14, left: 14),
                    child: Column(
                      children: [
                        Card(
                          elevation: 6,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).backgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        widget.onPressed!(true);
                                        setState(() {});
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AccountInformation(),
                                          ),
                                        ).then((value) {
                                          widget.onPressed!(false);
                                        });
                                      },
                                      child: account(
                                          Icons.search, "Account Information")),
                                  InkWell(
                                      onTap: () async {
                                        widget.onPressed!(true);
                                        setState(() {});
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyOrderScreen(),
                                          ),
                                        ).then((value) {
                                          widget.onPressed!(false);
                                        });
                                      },
                                      child: account(
                                          Icons.shopping_bag_outlined,
                                          "My Order")),
                                  InkWell(
                                    onTap: () async {
                                      widget.onPressed!(true);
                                      setState(() {});
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentMethod(),
                                        ),
                                      ).then((value) {
                                        widget.onPressed!(false);
                                      });
                                    },
                                    child: account(
                                        Icons.payment, "Payment Method"),
                                  ),
                                  account(Icons.delivery_dining_sharp,
                                      "Delivery Address",
                                      isShowDivider: false),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).backgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 34,
                                        width: 34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Icon(
                                          Icons.dark_mode,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Dark Mode",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize: 15,
                                            ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                            value: status,
                                            onChanged: (val) {
                                              setState(() {
                                                status = val;
                                              });
                                              if (status == true) {
                                                changeColor(context, dark);
                                              } else {
                                                changeColor(context, light);
                                              }
                                            },
                                            activeColor:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                  Divider(height: 30),
                                  account(
                                      Icons.headset_outlined, "Help Center"),
                                  account(Icons.help_outline_sharp, "About Us"),
                                  account(
                                      Icons.screen_share_outlined, "Share App",
                                      isShowDivider: false),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.LOGIN);
                          },
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).backgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 34,
                                          width: 34,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: Colors.grey[400]),
                                          child: Icon(
                                            Icons.logout,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Logout",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).padding.bottom + 70),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget account(IconData icn, String txt, {bool isShowDivider = true}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Theme.of(context).primaryColor),
              child: Icon(
                icn,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              txt,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 15,
                  ),
            ),
            Expanded(child: SizedBox()),
            Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).dividerColor,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        isShowDivider ? Divider() : SizedBox(),
        isShowDivider
            ? SizedBox(
                height: 10,
              )
            : SizedBox(),
      ],
    );
  }
}

int light = 1;
int dark = 2;
changeColor(BuildContext context, int color) {
  if (color == light) {
    MyApp.setCustomeTheme(context, 6);
  } else {
    MyApp.setCustomeTheme(context, 7);
  }
}
