// ignore_for_file: file_names, prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api
import 'package:delites/Constance/constance.dart';
import 'package:delites/Constance/theme.dart';
import 'package:delites/widget/favourite_cart_box.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class SearchScreen extends StatefulWidget {
  final void Function(bool)? onPressed;

  const SearchScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 14,
              left: 14,
              right: 14,
              bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Theme.of(context).dividerColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintText: 'Find something...',
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Theme.of(context).primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            children: [
              FavouriteCartBox(
                  img: ConstanceData.home2imag5,
                  itemName: 'Veg Sendwich',
                  price: '\$2.5',
                  quntityText: "1 Plate",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                img: ConstanceData.home5,
                itemName: 'Vda Pav',
                price: '\$4.5',
                quntityText: "2 Plate",
                onPressed: (isShow) {
                  widget.onPressed!(isShow);
                },
              ),
              FavouriteCartBox(
                  img: ConstanceData.home2imag4,
                  itemName: 'Kiwi Cake',
                  price: '\$1.5',
                  quntityText: "1 Plate",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.home3image1,
                  itemName: 'Khandvi',
                  price: '\$2.5',
                  quntityText: "2 Plate",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.i5,
                  itemName: 'Sugar',
                  price: '\$7.5',
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search1,
                  itemName: 'Orio',
                  price: '\$2',
                  color: HexColor("#004174"),
                  quntityText: "1 pkt",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search2,
                  itemName: 'Red Radicchio',
                  price: '\$8',
                  color: HexColor("#592e3f"),
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search3,
                  itemName: 'Olive Salad',
                  price: '\$4.7',
                  color: HexColor("#523a12"),
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search4,
                  itemName: 'Dettol',
                  price: '\$5.5',
                  color: HexColor("#60b94b"),
                  quntityText: "300 ml",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search5,
                  itemName: 'Bell Pepper',
                  price: '\$10',
                  color: HexColor("#f4b41f"),
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search6,
                  itemName: 'green-asparagus',
                  price: '\$7.5',
                  color: HexColor("#bac95c"),
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search7,
                  itemName: 'Smosa',
                  price: '\$8',
                  color: HexColor("#e69843"),
                  quntityText: "6 pcs",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search8,
                  itemName: 'Cake',
                  price: '\$8',
                  color: HexColor("#b9544c"),
                  quntityText: "1 pcs",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search9,
                  itemName: 'Nuddles',
                  price: '\$3.6',
                  quntityText: "1  Dish",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search10,
                  itemName: 'South Indian',
                  price: '\$2.7',
                  color: HexColor("#727d38"),
                  quntityText: "1  Dish",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search11,
                  itemName: 'Pizza',
                  price: '\$5',
                  quntityText: "1  pcs",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search12,
                  itemName: 'Soap',
                  price: '\$7',
                  color: HexColor("#41a976"),
                  quntityText: "1  pcs",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
              FavouriteCartBox(
                  img: ConstanceData.search13,
                  itemName: 'Msala',
                  price: '\$10',
                  quntityText: "1  pkt",
                  onPressed: (isShow) {
                    widget.onPressed!(isShow);
                  }),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 60),
      ],
    );
  }

  Widget favourite(
    String img,
    String txt1,
    String txt2, {
    String quntityText = "Price Per Kg",
    Color? color,
  }) {
    return Card(
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
                    color: color,
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
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          txt2,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
    );
  }
}
