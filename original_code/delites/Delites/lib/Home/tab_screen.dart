// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_declarations, depend_on_referenced_packages, library_private_types_in_public_api, sort_child_properties_last

import 'package:delites/Constance/constance.dart';
import 'package:delites/Constance/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delites/Home/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'dinner_view.dart';

class Tab1 extends StatefulWidget {
  final void Function(bool)? onPressed;

  const Tab1({Key? key, this.onPressed}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  Widget foodType(String boxColor, String name, String image) {
    return Row(
      children: [
        Container(
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: HexColor(boxColor),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 12),
            child: Row(
              children: [
                Image.asset(
                  image,
                ),
                Expanded(child: SizedBox()),
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<String> list = [
    ConstanceData.home1,
    ConstanceData.home2,
    ConstanceData.home3,
    ConstanceData.home4,
    ConstanceData.home5,
    ConstanceData.home6,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top + 16,
          color: Theme.of(context).backgroundColor,
        ),
        Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Theme.of(context).dividerColor,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Find something...',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(color: Theme.of(context).backgroundColor, height: 16),
        InkWell(
          onTap: () async {
            widget.onPressed!(true);
            setState(() {});
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TabView(
                  onPressed: (val) {},
                ),
              ),
            ).then((value) {
              widget.onPressed!(false);
            });
          },
          child: Container(
            height: 50,
            color: Theme.of(context).backgroundColor,
            child: ListView(
              padding: const EdgeInsets.only(right: 14, left: 14),
              scrollDirection: Axis.horizontal,
              children: [
                foodType("#884dfd", "Foods", ConstanceData.imag1),
                SizedBox(width: 12),
                foodType("#59c2e9", "Fruits", ConstanceData.imag2),
                SizedBox(width: 12),
                foodType("#9f9093", "Healthy", ConstanceData.imag3),
                SizedBox(width: 12),
                foodType("#65b804", "Snack", ConstanceData.imag4),
                SizedBox(width: 12),
                foodType("#ded586", "Vegetable", ConstanceData.imag5),
                SizedBox(width: 12),
                foodType("#85c0d6", "Drink", ConstanceData.imag6),
                SizedBox(width: 12),
                foodType("#264057", "Nuts", ConstanceData.imag7),
                SizedBox(width: 12),
                foodType("#fdb26a", "Tablet", ConstanceData.imag8),
              ],
            ),
          ),
        ),
        Container(
          color: Theme.of(context).backgroundColor,
          height: 16,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(top: 16),
            children: [
              CarouselSlider(
                items: list
                    .map(
                      (item) => Card(
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        elevation: 0,
                        child: InkWell(
                          onTap: () async {
                            widget.onPressed!(true);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DinnerView(
                                  image: item,
                                ),
                              ),
                            ).then((value) {
                              widget.onPressed!(false);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(
                                  item,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.5,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              MySeparator(color: Theme.of(context).primaryColor),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Take Your Pick",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 14),
                  children: [
                    takeYourPick(
                      ConstanceData.home2img1,
                      "Fresh Salad Thaid",
                      "10 mins",
                      "268 kcal",
                    ),
                    takeYourPick(
                      ConstanceData.home2img2,
                      "Egg Fry",
                      "15 mins",
                      "345 kcal",
                    ),
                    takeYourPick(
                      ConstanceData.home2img3,
                      "Salad Peaces",
                      "2 mins",
                      "100 kcal",
                    ),
                    takeYourPick(
                      ConstanceData.home2img4,
                      "Shushi",
                      "20 mins",
                      "500 kcal",
                    ),
                    takeYourPick(
                      ConstanceData.home2img5,
                      "Potato curry",
                      "15 mins",
                      "230 kcal",
                    ),
                    takeYourPick(
                      ConstanceData.home2img6,
                      "Green Dish",
                      "14 mins",
                      "100 kcal",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              MySeparator(color: Theme.of(context).primaryColor),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breakfast",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  "Breakfast is widely acknowledged to be the most important meal of the day.",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  children: [
                    breakfast(
                      ConstanceData.home2imag1,
                      "Fresh Salad Thaid",
                      "10 mins",
                      "268 kcal",
                    ),
                    breakfast(
                      ConstanceData.home2imag2,
                      "Egg Fry",
                      "15 mins",
                      "345 kcal",
                    ),
                    breakfast(
                      ConstanceData.home2imag3,
                      "Salad Peaces",
                      "2 mins",
                      "100 kcal",
                    ),
                    breakfast(
                      ConstanceData.home2imag4,
                      "Shushi",
                      "20 mins",
                      "500 kcal",
                    ),
                    breakfast(
                      ConstanceData.home2imag5,
                      "Potato curry",
                      "15 mins",
                      "230 kcal",
                    ),
                    breakfast(
                      ConstanceData.home2imag6,
                      "Green Dish",
                      "14 mins",
                      "100 kcal",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              MySeparator(color: Theme.of(context).primaryColor),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Snack",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  "Snacking allows you not to fell hungry during the day and prevents a decrease inblood glucode.",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  children: [
                    breakfast(ConstanceData.home3image1, "Fresh Salad Thaid",
                        "10 mins", "268 kcal"),
                    breakfast(ConstanceData.home3image2, "Egg Fry", "15 mins",
                        "345 kcal"),
                    breakfast(ConstanceData.home3image3, "Salad Peaces",
                        "2 mins", "100 kcal"),
                    breakfast(ConstanceData.home3image4, "Shushi", "20 mins",
                        "500 kcal"),
                    breakfast(ConstanceData.home3image5, "Potato curry",
                        "15 mins", "230 kcal"),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              MySeparator(color: Theme.of(context).primaryColor),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lunch",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  "Lunch usually refers to the most significant meal of the day.",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  children: [
                    breakfast(ConstanceData.lunch1, "Fresh Salad Thaid",
                        "10 mins", "268 kcal"),
                    breakfast(
                        ConstanceData.lunch2, "Egg Fry", "15 mins", "345 kcal"),
                    breakfast(ConstanceData.lunch3, "Salad Peaces", "2 mins",
                        "100 kcal"),
                    breakfast(
                        ConstanceData.lunch4, "Shushi", "20 mins", "500 kcal"),
                    breakfast(ConstanceData.lunch5, "Potato curry", "15 mins",
                        "230 kcal"),
                    breakfast(ConstanceData.lunch6, "Potato curry", "15 mins",
                        "230 kcal"),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              MySeparator(color: Theme.of(context).primaryColor),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dinner",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  "Dinner is your last meal 2-3 hours before bedtime.",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  children: [
                    breakfast(ConstanceData.dinner1, "Fresh Salad Thaid",
                        "10 mins", "268 kcal"),
                    breakfast(ConstanceData.dinner2, "Egg Fry", "15 mins",
                        "345 kcal"),
                    breakfast(ConstanceData.dinner3, "Salad Peaces", "2 mins",
                        "100 kcal"),
                    breakfast(
                        ConstanceData.dinner4, "Shushi", "20 mins", "500 kcal"),
                    breakfast(ConstanceData.dinner5, "Potato curry", "15 mins",
                        "230 kcal"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom + 50,
        )
      ],
    );
  }

  Widget breakfast(String image, String name, String time, String kcal) {
    return Row(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () async {
                widget.onPressed!(true);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DinnerView(
                      image: image,
                      name: name,
                      time: time,
                      kcal: kcal,
                    ),
                  ),
                ).then((value) {
                  widget.onPressed!(false);
                });
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GlassContainer(
                  height: 30,
                  width: 30,
                  blur: 4,
                  shadowStrength: 10,
                  opacity: 0.2,
                  //--code to remove border
                  border: Border.fromBorderSide(BorderSide.none),
                  borderRadius: BorderRadius.circular(10),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 16,
        )
      ],
    );
  }

  Widget takeYourPick(String image, String name, String time, String kcal) {
    return InkWell(
      onTap: () async {
        widget.onPressed!(true);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DinnerView(
              image: image,
              name: name,
              time: time,
              kcal: kcal,
            ),
          ),
        ).then((value) {
          widget.onPressed!(false);
        });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.0),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    image,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            name,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 14,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            time,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            kcal,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double? height;
  final Color? color;

  const MySeparator({this.height = 1.3, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
