// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
                  top: MediaQuery.of(context).padding.top + 20,
                  left: 14,
                  right: 14,
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
                    "Payment Method",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Payment Method",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 17,
                                    ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab1 = true;
                                tab2 = false;
                              });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 3,
                                    margin: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Theme.of(context)
                                              .backgroundColor),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    ConstanceData.mastercard,
                                                    height: 20,
                                                    width: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Expanded(child: SizedBox()),
                                                  Text(
                                                    "******** ***** *567",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                          fontSize: 15,
                                                        ),
                                                  ),
                                                  Expanded(child: SizedBox()),
                                                  Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: Colors.grey,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                tab1
                                    ? Icon(
                                        Icons.check_circle,
                                        size: 30,
                                        color: primacolor,
                                      )
                                    : Icon(
                                        Icons.circle_outlined,
                                        size: 30,
                                      )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tab2 = true;
                                tab1 = false;
                              });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 3,
                                    margin: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Theme.of(context)
                                              .backgroundColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  ConstanceData.visacard,
                                                  height: 20,
                                                  width: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                                Expanded(child: SizedBox()),
                                                Text(
                                                  "******** ***** *567",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        fontSize: 15,
                                                      ),
                                                ),
                                                Expanded(child: SizedBox()),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                tab2
                                    ? Icon(
                                        Icons.check_circle,
                                        size: 30,
                                        color: primacolor,
                                      )
                                    : Icon(
                                        Icons.circle_outlined,
                                        size: 30,
                                      )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Add New Method",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 17,
                                    ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            margin: EdgeInsets.all(0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).backgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          ConstanceData.visacard,
                                          height: 20,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "Visa Card",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                fontSize: 15,
                                              ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Card(
                            elevation: 3,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).backgroundColor),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Card Number",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 3,
                                  margin: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color:
                                            Theme.of(context).backgroundColor),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "valid thru",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            Expanded(child: SizedBox()),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: Colors.grey,
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 3,
                                  margin: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color:
                                            Theme.of(context).backgroundColor),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "CVV",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                            height: 50,
                            onPressed: () {},
                            text: 'Add New Method',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
