// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/profile/compelete.dart';
import 'package:delites/profile/ongoing.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  bool tab1 = true;
  bool tab2 = false;

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.keyboard_backspace_rounded)),
                      Text(
                        "My Order",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox()
                    ],
                  ),
                  SizedBox(height: defaultPadding * 2),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            tab1 = true;
                            tab2 = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Ongoing",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 15,
                                      color: tab1
                                          ? primacolor
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .color),
                            ),
                            SizedBox(height: 6),
                            Container(
                              height: 2,
                              width: 50,
                              color: tab1
                                  ? primacolor
                                  : Theme.of(context).backgroundColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tab1 = false;
                            tab2 = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Complete",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 15,
                                      color: tab2
                                          ? primacolor
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .color),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 2,
                              width: 50,
                              color: tab2
                                  ? primacolor
                                  : Theme.of(context).backgroundColor,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(defaultPadding),
              children: [
                tab1 ? OnGoing() : Complete(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
