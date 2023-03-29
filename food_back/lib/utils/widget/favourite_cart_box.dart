// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unrelated_type_equality_checks, unnecessary_null_comparison, must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:like_button/like_button.dart';

class FavouriteCartBox extends StatefulWidget {
  final String img;
  final String itemName;
  final String price;
  final String? quntityText;
  final Color? color;
  bool? priceAndCarticon;
  final void Function(bool)? onPressed;

  FavouriteCartBox({
    Key? key,
    required this.img,
    required this.itemName,
    required this.price,
    this.quntityText,
    this.color,
    this.priceAndCarticon,
    this.onPressed,
  }) : super(key: key);

  @override
  State<FavouriteCartBox> createState() => _FavouriteCartBoxState();
}

class _FavouriteCartBoxState extends State<FavouriteCartBox> {
  @override
  Widget build(BuildContext context) {
    return 
    // InkWell(
    //   onTap: () async {
    //     widget.onPressed!(true);
    //     await Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ItemView(
    //           widget.price,
    //           image: widget.img,
    //           itemName: widget.itemName,
    //           bgColor: widget.color,
    //         ),
    //       ),
    //     ).then((value) {
    //       widget.onPressed!(false);
    //     });
    //   },
      // child:
       Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
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
                      color: widget.color,
                      child: Hero(
                        tag: widget.itemName,
                        child: Image.asset(
                          widget.img,
                          fit: widget.color != null && widget.color != ""
                              ? BoxFit.contain
                              : BoxFit.fill,
                          height: 135,
                          width: MediaQuery.of(context).size.width,
                        ),
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
                        widget.itemName,
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
                        widget.quntityText != null && widget.quntityText != ""
                            ? widget.quntityText!
                            : "Price Per Kg",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      widget.priceAndCarticon != null &&
                              widget.priceAndCarticon != ""
                          ? SizedBox()
                          : Row(
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
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "\$7.5",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Expanded(child: SizedBox()),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.add_shopping_cart_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      // ),
    );
  }
}
