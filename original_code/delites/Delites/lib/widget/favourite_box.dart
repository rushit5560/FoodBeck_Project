// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, depend_on_referenced_packages

import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

Widget favourite(
  String img,
  String txt1, {
  String quntityText = "Price Per Kg",
  Color? color,
  required BuildContext context,
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
          Padding(
            padding:
                const EdgeInsets.only(left: 13, top: 5, right: 13, bottom: 8),
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
        ],
      ),
    ),
  );
}

// class FavouriteBox extends StatelessWidget {
//   final String img;
//   final String txt1;
//   final String quntityText = "Price Per Kg";
//   final Color color;

//   FavouriteBox(
//     this.color, {
//     Key? key,
//     required this.img,
//     required this.txt1,
//     String? quntityText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(13),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(13),
//           color: Theme.of(context).backgroundColor,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(13),
//                     topRight: Radius.circular(13),
//                   ),
//                   child: Container(
//                     color: color,
//                     child: Image.asset(
//                       img,
//                       fit: BoxFit.fill,
//                       height: 135,
//                       width: MediaQuery.of(context).size.width,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(6),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: GlassContainer(
//                       height: 35,
//                       width: 35,
//                       blur: 4,
//                       shadowStrength: 10,
//                       opacity: 0.2,
//                       border: Border.fromBorderSide(BorderSide.none),
//                       borderRadius: BorderRadius.circular(10),
//                       child: LikeButton(
//                         size: 18,
//                         circleColor:
//                             CircleColor(start: Colors.red, end: Colors.red),
//                         bubblesColor: BubblesColor(
//                           dotPrimaryColor: Colors.red,
//                           dotSecondaryColor: Colors.red,
//                         ),
//                         likeBuilder: (bool isLiked) {
//                           return !isLiked
//                               ? Icon(
//                                   Icons.favorite_border_outlined,
//                                   color: Colors.white,
//                                   size: 20,
//                                 )
//                               : Icon(
//                                   Icons.favorite,
//                                   color: Colors.red,
//                                   size: 20,
//                                 );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 13, top: 5, right: 13),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       txt1,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       quntityText,
//                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                             fontSize: 13,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.bold,
//                           ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
