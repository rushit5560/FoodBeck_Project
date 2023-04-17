// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_element, depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:async';

import 'package:delites/Constance/constance.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class TrackMap extends StatefulWidget {
  const TrackMap({Key? key}) : super(key: key);

  @override
  _TrackMapState createState() => _TrackMapState();
}

class _TrackMapState extends State<TrackMap> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

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
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    defaultPadding,
                    defaultPadding,
                    defaultPadding,
                    MediaQuery.of(context).padding.bottom + defaultPadding),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(defaultRadius)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Row(
                        children: [
                          Text("Shipper Information",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                    Divider(height: 0),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage(ConstanceData.profile)),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Column(
                              children: [
                                Text("Martin Schmidt",
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Text("+1(245)12 1545 124",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Theme.of(context).primaryColor),
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: defaultPadding),
                          Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.blue[700]),
                            child: Icon(
                              Icons.message_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 0),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Estimated Time",
                              style: Theme.of(context).textTheme.bodyText2),
                          Text("42 mins",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
