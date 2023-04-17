// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/Home/dinner_view.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class Meals extends StatefulWidget {
  final void Function(bool)? onPressed;

  const Meals({Key? key, this.onPressed}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        children: [
          favourite(ConstanceData.lunch1, "Veg Rice", "Dinner"),
          favourite(ConstanceData.lunch2, "7 veg curry", "Lunch"),
          favourite(ConstanceData.lunch4, "Punjabi Curry", "Lunch"),
          favourite(ConstanceData.lunch5, "non veg Curry", "Dinner"),
          favourite(ConstanceData.lunch6, "non veg Curry", "Dinner"),
          favourite(ConstanceData.dinner1, "Mix Curry", "Dinner"),
          favourite(ConstanceData.dinner2, "Veg Full Dish", "Dinner"),
          favourite(ConstanceData.dinner3, "Masala chiken", "Lunch"),
          favourite(ConstanceData.dinner4, "Masala chiken", "Lunch"),
          favourite(ConstanceData.dinner5, "South Indian", "Lunch"),
        ],
      ),
    );
  }

  Widget favourite(String img, String txt1, String quntityText) {
    return InkWell(
      onTap: () async {
        widget.onPressed!(true);
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DinnerView(
                image: img,
                name: txt1,
              ),
            )).then((value) {
          widget.onPressed!(false);
        });
      },
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => DinnerView(
      //           image: img,
      //           name: txt1,
      //         ),
      //       ));
      // },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13),
                    ),
                    child: Container(
                      color: Theme.of(context).cardColor,
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                        height: 135,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: GlassContainer(
                        height: 35,
                        width: 35,
                        blur: 4,
                        shadowStrength: 10,
                        opacity: 0.2,
                        border: Border.fromBorderSide(BorderSide.none),
                        borderRadius: BorderRadius.circular(10),
                        child: LikeButton(
                          size: 18,
                          circleColor:
                              CircleColor(start: Colors.red, end: Colors.red),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Colors.red,
                            dotSecondaryColor: Colors.red,
                          ),
                          likeBuilder: (bool isLiked) {
                            return !isLiked
                                ? Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, top: 5, right: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        txt1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        quntityText,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
