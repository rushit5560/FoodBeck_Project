// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/Constance/theme.dart';
import 'package:delites/widget/favourite_cart_box.dart';
import 'package:flutter/material.dart';

class Ingridients extends StatefulWidget {
  final void Function(bool)? onPressed;
  const Ingridients({Key? key, this.onPressed}) : super(key: key);

  @override
  _IngridientsState createState() => _IngridientsState();
}

class _IngridientsState extends State<Ingridients> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        children: [
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev1,
              itemName: "Vietnam Rice A",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev2,
              itemName: "Salt",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev3,
              itemName: "Meat",
              color: HexColor("#c54449"),
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev4,
              color: HexColor("#c38c31"),
              itemName: "Vietnam Asparagus",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev5,
              color: HexColor("#f3a960"),
              itemName: "Almond",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev6,
              itemName: "Fish",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev7,
              color: HexColor("#5fa93c"),
              itemName: "Fitness",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev8,
              color: HexColor("#e3ba86"),
              itemName: "Handwash",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev9,
              color: HexColor("#fec10e"),
              itemName: "Besan",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev10,
              color: HexColor("#092f20"),
              itemName: "Ceylon Tea",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev11,
              color: HexColor("#61c536"),
              itemName: "Pudin Hara",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
          FavouriteCartBox(
              priceAndCarticon: false,
              img: ConstanceData.fev12,
              color: HexColor("#03ab60"),
              itemName: "Dermi Cool",
              price: '\$2.5',
              onPressed: (isShow) {
                widget.onPressed!(isShow);
              }),
        ],
      ),
    );
  }

  // Widget favourite(
  //   String img,
  //   String txt1, {
  //   String quntityText = "Price Per Kg",
  //   Color? Color,
  // }) {
  //   return Card(
  //     elevation: 5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(13),
  //     ),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(13),
  //         color: Theme.of(context).backgroundColor,
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Stack(
  //             alignment: Alignment.topRight,
  //             children: [
  //               ClipRRect(
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(13),
  //                   topRight: Radius.circular(13),
  //                 ),
  //                 child: Container(
  //                   color: Color,
  //                   child: Image.asset(
  //                     img,
  //                     fit: BoxFit.fill,
  //                     height: 135,
  //                     width: MediaQuery.of(context).size.width,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(6),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(8),
  //                   child: GlassContainer(
  //                     height: 35,
  //                     width: 35,
  //                     blur: 4,
  //                     shadowStrength: 10,
  //                     opacity: 0.2,
  //                     border: Border.fromBorderSide(BorderSide.none),
  //                     borderRadius: BorderRadius.circular(10),
  //                     child: LikeButton(
  //                       size: 18,
  //                       circleColor: CircleColor(start: Colors.red, end: Colors.red),
  //                       bubblesColor: BubblesColor(
  //                         dotPrimaryColor: Colors.red,
  //                         dotSecondaryColor: Colors.red,
  //                       ),
  //                       likeBuilder: (bool isLiked) {
  //                         return !isLiked
  //                             ? Icon(
  //                                 Icons.favorite_border_outlined,
  //                                 color: Colors.white,
  //                                 size: 20,
  //                               )
  //                             : Icon(
  //                                 Icons.favorite,
  //                                 color: Colors.red,
  //                                 size: 20,
  //                               );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.only(left: 13, top: 5, right: 13),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(
  //                     height: 2,
  //                   ),
  //                   Text(
  //                     txt1,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: Theme.of(context).textTheme.bodyText1!.copyWith(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                   ),
  //                   SizedBox(
  //                     height: 4,
  //                   ),
  //                   Text(
  //                     quntityText,
  //                     style: Theme.of(context).textTheme.bodyText1!.copyWith(
  //                           fontSize: 13,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
