// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_new_address.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                  left: 14,
                  right: 18,
                  bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.keyboard_backspace_rounded)),
                  Text(
                    "Change Delivery Address",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 16,
                ),
                addressDetail("Home", "147, kere Terrace, New York, US.",
                    isShowDefAdd: true),
                SizedBox(
                  height: 16,
                ),
                addressDetail("Work", "345, Ninja way, New York, US.",
                    isShowDefAdd: false),
                SizedBox(
                  height: 16,
                ),
                addressDetail("Company", "89, Cazkup Trail, New York, US.",
                    isShowDefAdd: false),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: CustomButton(
                    height: 50,
                    text: 'Add New Address',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewAddress()),
                      );
                      // showModalBottomSheet(
                      //   context: context,
                      //   // isScrollControlled: true,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (context) {
                      //     return StatefulBuilder(builder:
                      //         (BuildContext context, StateSetter setState) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //             color:
                      //                 Theme.of(context).scaffoldBackgroundColor,
                      //             borderRadius: BorderRadius.vertical(
                      //                 top: Radius.circular(20.0))),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(defaultPadding),
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             // controller: controller,
                      //             children: [
                      //               Padding(
                      //                 padding: EdgeInsets.only(
                      //                     bottom: defaultPadding),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     Text('Clear',
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .bodyText2),
                      //                     Text('Add New Address',
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .headline1!
                      //                             .copyWith(
                      //                                 fontSize: 17,
                      //                                 fontWeight:
                      //                                     FontWeight.bold)),
                      //                     GestureDetector(
                      //                       onTap: () {
                      //                         Navigator.pop(context);
                      //                       },
                      //                       child: Text('Save',
                      //                           style: Theme.of(context)
                      //                               .textTheme
                      //                               .bodyText2!
                      //                               .copyWith(
                      //                                 color: Theme.of(context)
                      //                                     .primaryColor,
                      //                               )),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               Divider(
                      //                   thickness: 0.8,
                      //                   height: 0,
                      //                   color: Theme.of(context).dividerColor),
                      //               Padding(
                      //                 padding: EdgeInsets.symmetric(
                      //                     vertical: defaultPadding),
                      //                 child: Row(
                      //                   children: [
                      //                     Flexible(
                      //                       child: Container(
                      //                         padding: EdgeInsets.fromLTRB(
                      //                             defaultPadding, 0, 8, 0),
                      //                         height: 50,
                      //                         decoration: BoxDecoration(
                      //                             color: Theme.of(context)
                      //                                 .backgroundColor,
                      //                             borderRadius:
                      //                                 BorderRadius.circular(
                      //                                     defaultRadius - 6)),
                      //                         child: Row(
                      //                           children: [
                      //                             Icon(Icons.home),
                      //                             Spacer(),
                      //                             RotatedBox(
                      //                               quarterTurns: 2,
                      //                               child: Icon(
                      //                                 Icons
                      //                                     .keyboard_arrow_up_rounded,
                      //                                 color: Colors.grey,
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: defaultPadding),
                      //                     Flexible(
                      //                         flex: 3,
                      //                         child: Container(
                      //                           padding: EdgeInsets.fromLTRB(
                      //                               defaultPadding, 3, 0, 0),
                      //                           height: 50,
                      //                           decoration: BoxDecoration(
                      //                               color: Theme.of(context)
                      //                                   .backgroundColor,
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       defaultRadius - 6)),
                      //                           child: TextFormField(
                      //                             decoration: InputDecoration(
                      //                                 hintText: "",
                      //                                 border: InputBorder.none,
                      //                                 suffixIcon: RotatedBox(
                      //                                   quarterTurns: 2,
                      //                                   child: Icon(
                      //                                     Icons
                      //                                         .keyboard_arrow_up_rounded,
                      //                                     color: Colors.grey,
                      //                                   ),
                      //                                 )),
                      //                           ),
                      //                         ))
                      //                   ],
                      //                 ),
                      //               ),
                      //               Container(
                      //                 height: 50,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(
                      //                       defaultRadius - 6),
                      //                   color:
                      //                       Theme.of(context).backgroundColor,
                      //                 ),
                      //                 child: Row(
                      //                   children: [
                      //                     Expanded(
                      //                       child: TextFormField(
                      //                         decoration: InputDecoration(
                      //                           contentPadding:
                      //                               EdgeInsets.only(left: 10),
                      //                           border: InputBorder.none,
                      //                           hintText: 'Your Address',
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 6),
                      //                     Container(
                      //                       height: 36,
                      //                       width: 36,
                      //                       decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(13),
                      //                           color: Theme.of(context)
                      //                               .primaryColor),
                      //                       child: Center(
                      //                         child: Icon(
                      //                           Icons.location_on_outlined,
                      //                           color: Colors.white,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 6),
                      //                   ],
                      //                 ),
                      //               ),
                      //               SizedBox(height: defaultPadding),
                      //               Container(
                      //                 height: 50,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(
                      //                       defaultRadius - 6),
                      //                   color:
                      //                       Theme.of(context).backgroundColor,
                      //                 ),
                      //                 child: Row(
                      //                   children: [
                      //                     CountryCodePicker(
                      //                       onChanged: print,
                      //                       initialSelection: 'IT',
                      //                       favorite: ['+39', 'FR'],
                      //                       showCountryOnly: false,
                      //                       showOnlyCountryWhenClosed: false,
                      //                       alignLeft: false,
                      //                     ),
                      //                     Expanded(
                      //                       child: TextFormField(
                      //                         keyboardType: TextInputType.phone,
                      //                         decoration: InputDecoration(
                      //                           contentPadding:
                      //                               EdgeInsets.only(left: 10),
                      //                           hintText: "(000)00 000 0000",
                      //                           border: InputBorder.none,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               SizedBox(height: defaultPadding),
                      //               InkWell(
                      //                 onTap: () {
                      //                   setState(() {
                      //                     _value = !_value;
                      //                   });
                      //                 },
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       height: 26,
                      //                       width: 26,
                      //                       decoration: BoxDecoration(
                      //                           shape: BoxShape.circle,
                      //                           border: Border.all(
                      //                               color: Theme.of(context)
                      //                                   .dividerColor),
                      //                           color: _value
                      //                               ? Theme.of(context)
                      //                                   .primaryColor
                      //                               : Theme.of(context)
                      //                                   .backgroundColor),
                      //                       child: Center(
                      //                         child: _value
                      //                             ? Icon(
                      //                                 Icons.check,
                      //                                 color: Colors.white,
                      //                                 size: 15,
                      //                               )
                      //                             : SizedBox(
                      //                                 height: 26,
                      //                                 width: 26,
                      //                               ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: defaultPadding),
                      //                     Text("Dafault Delivery Address")
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                      //   },
                      // );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget addressDetail(String location, String addressLine,
      {bool isShowDefAdd = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Expanded(child: SizedBox()),
                  isShowDefAdd
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeAddress(),
                              ),
                            );
                          },
                          child: Text(
                            "Default Address",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          ConstanceData.map,
                          height: 70,
                        ),
                      ),
                      Image.asset(
                        ConstanceData.mappin,
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        address(
                          CupertinoIcons.location,
                          addressLine,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        address(
                          CupertinoIcons.person,
                          "Todd Benson",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        address(
                          CupertinoIcons.phone,
                          "+1(234)86 1122 099",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget address(IconData iconData, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: Colors.grey,
          size: 18,
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }
}
