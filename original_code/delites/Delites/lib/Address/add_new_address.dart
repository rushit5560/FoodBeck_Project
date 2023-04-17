// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unnecessary_new, unused_element, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:async';
import 'package:delites/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:country_code_picker/country_code_picker.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  late GoogleMapController mapController;
  bool _value = true;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      defaultPadding,
                      defaultPadding,
                      defaultPadding,
                      MediaQuery.of(context).padding.bottom + defaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // controller: controller,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Clear',
                                style: Theme.of(context).textTheme.bodyText2),
                            Text('Add New Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text('Save',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      )),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          thickness: 0.8,
                          height: 0,
                          color: Theme.of(context).dividerColor),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    defaultPadding, 0, 8, 0),
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(
                                        defaultRadius - 6)),
                                child: Row(
                                  children: [
                                    Icon(Icons.home),
                                    Spacer(),
                                    RotatedBox(
                                      quarterTurns: 2,
                                      child: Icon(
                                        Icons.keyboard_arrow_up_rounded,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: defaultPadding),
                            Flexible(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultPadding, 3, 0, 0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(
                                          defaultRadius - 6)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "",
                                        border: InputBorder.none,
                                        suffixIcon: RotatedBox(
                                          quarterTurns: 2,
                                          child: Icon(
                                            Icons.keyboard_arrow_up_rounded,
                                            color: Colors.grey,
                                          ),
                                        )),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 6),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintText: 'Your Address',
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Theme.of(context).primaryColor),
                              child: Center(
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                          ],
                        ),
                      ),
                      SizedBox(height: defaultPadding),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultRadius - 6),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              onChanged: print,
                              initialSelection: 'IT',
                              favorite: ['+39', 'FR'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: "(000)00 000 0000",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: defaultPadding),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _value = !_value;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Theme.of(context).dividerColor),
                                  color: _value
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).backgroundColor),
                              child: Center(
                                child: _value
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox(
                                        height: 26,
                                        width: 26,
                                      ),
                              ),
                            ),
                            SizedBox(width: defaultPadding),
                            Text("Dafault Delivery Address")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: AppBar().toolbarHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.transparent, Colors.black54],
            )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      left: defaultPadding),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(
                        top:
                            MediaQuery.of(context).padding.top + defaultPadding,
                        left: defaultPadding,
                        right: defaultPadding,
                        bottom: defaultPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        color: Theme.of(context).backgroundColor),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: defaultPadding),
                              border: InputBorder.none,
                              hintText: 'Type Location you want...',
                            ),
                          ),
                        ),
                        // SizedBox(width: defaultPadding),
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              color: Theme.of(context).primaryColor),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
