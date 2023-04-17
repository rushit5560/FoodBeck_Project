// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/Favourite/meals.dart';
import 'package:flutter/material.dart';

import 'ingridents.dart';

class FavouriteScreen extends StatefulWidget {
  final void Function(bool)? onPressed;
  const FavouriteScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool tab1 = true;
  bool tab2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 14,
                left: 14,
                right: 14,
                bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Favourites",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                            "Ingredients",
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
                          SizedBox(
                            height: 6,
                          ),
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
                            "Meals",
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
        tab1
            ? Ingridients(
                onPressed: (isshow) {
                  widget.onPressed!(isshow);
                },
              )
            : Meals(
                onPressed: (isshow) {
                  widget.onPressed!(isshow);
                },
              ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom + 50,
        ),
      ],
    );
  }
}
