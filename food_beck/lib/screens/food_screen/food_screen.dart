// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:like_button/like_button.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../controllers/food_screen_controller.dart';

class FoodScreen extends StatelessWidget {
  FoodScreen({Key? key}) : super(key: key);
  final foodScreenController = Get.put(FoodScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    "Food",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                // primary: false,
                itemCount: 10,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
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
                                  color: AppColors.amberColor,
                                  child: Hero(
                                    tag: 'dkkf',
                                    child: Image.asset(
                                      AppImages.strawberry,
                                      fit: BoxFit.fill,
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
                                  child: GlassmorphicContainer(
                                    height: 35,
                                    width: 35,
                                    blur: 4,
                                    border: 1.0,
                                    borderRadius: 10,
                                    linearGradient: LinearGradient(colors: []),
                                    borderGradient: LinearGradient(colors: []),
                                    child: LikeButton(
                                      size: 18,
                                      circleColor: CircleColor(
                                          start: Colors.red, end: Colors.red),
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor: Colors.red,
                                        dotSecondaryColor: Colors.red,
                                      ),
                                      // likeBuilder: (bool isLiked) {
                                      //   return foodScreenController.isLiked.value
                                      //         ? Icon(
                                      //             Icons.favorite_border_outlined,
                                      //             color: Colors.white,
                                      //             size: 20,
                                      //           )
                                      //         : Icon(
                                      //             Icons.favorite,
                                      //             color: Colors.red,
                                      //             size: 20,
                                      //           );
                                      // },
                                      likeBuilder: (bool isLiked) {
                                        return foodScreenController
                                                .isLiked.value
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
                              padding: const EdgeInsets.only(
                                  left: 13, top: 5, right: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'fmknejf',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'kjfdnejkf' != null && 'jfnje' != ""
                                        ? 'nfjenf'
                                        : "Price Per Kg",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  'dmeklfm' != null && 'dkjneded' != ""
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            Text(
                                              'djkd',
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
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Expanded(child: SizedBox()),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  color: Colors.green,
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
