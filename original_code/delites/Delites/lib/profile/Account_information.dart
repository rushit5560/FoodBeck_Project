// ignore_for_file: file_names, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({Key? key}) : super(key: key);

  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20, left: 14, right: 14, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.keyboard_backspace_rounded)),
                  Text(
                    "Account Information",
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              children: [
                information("Logout", "Todd Benson"),
                information("Email", "toddebenson@gmail.com"),
                information("Password", "*****"),
                information("Phone Number", "+1(234)40 5156 999"),
                information("Date Of Birth", "Oct 15, 1997"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget information(String txt, String txt2) {
    return Column(
      children: [
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          txt,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          txt2,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 15,
                              ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).dividerColor,
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
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
