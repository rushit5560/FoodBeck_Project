// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';

import 'track_map.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  double _status = 0.6666666666666666;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#ODGR45IJH", style: Theme.of(context).textTheme.bodyText2),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            defaultPadding,
            defaultPadding,
            defaultPadding,
            MediaQuery.of(context).padding.top + defaultPadding),
        physics: BouncingScrollPhysics(),
        children: [
          Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).backgroundColor),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _status == 0.0
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey),
                        ),
                        Text(
                          "Arrange",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _status == 0.3333333333333333
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey),
                        ),
                        Text(
                          "Shipping",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _status == 0.6666666666666666
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey),
                        ),
                        Text(
                          "Done",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: _status == 1.0
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Slider(
                        divisions: 3,
                        value: _status,
                        onChanged: (updateStatus) {
                          setState(() => {
                                _status = updateStatus,
                              });
                        },
                        inactiveColor: Colors.grey[300],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.5),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    radius: 6),
                                CircleAvatar(
                                    backgroundColor:
                                        _status == 0.3333333333333333 ||
                                                _status == 0.6666666666666666 ||
                                                _status == 1.0
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey[300],
                                    radius: 6),
                                CircleAvatar(
                                    backgroundColor:
                                        _status == 0.6666666666666666 ||
                                                _status == 1.0
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey[300],
                                    radius: 6),
                                CircleAvatar(
                                    backgroundColor: _status == 1.0
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[300],
                                    radius: 6),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    backgroundColor: _status == 0.0
                                        ? Colors.white
                                        : Colors.transparent,
                                    radius: 6),
                                CircleAvatar(
                                    backgroundColor:
                                        _status == 0.3333333333333333
                                            ? Colors.white
                                            : Colors.transparent,
                                    radius: 6),
                                CircleAvatar(
                                    backgroundColor:
                                        _status == 0.6666666666666666
                                            ? Colors.white
                                            : Colors.transparent,
                                    radius: 6),
                                CircleAvatar(
                                    backgroundColor: _status == 1.0
                                        ? Colors.white
                                        : Colors.transparent,
                                    radius: 6),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  CustomButton(
                    height: 50,
                    text: 'Track Map',
                    onPressed: () {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrackMap(),
                                ),
                              );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).backgroundColor),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Order Bill",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Order List",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "12 Items",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Total Bill",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "\$56.68",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Delivery Fee",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "\$10.05",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, defaultPadding),
                    child: Row(
                      children: [
                        Text(
                          "Total Bill",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "\$66.73",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 15, color: primacolor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
