// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, Routes.LOGIN);

        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(right: 14, left: 14, bottom: 0, top: 0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 16,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Text(
                      "Forgot Password",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14),
                      child: Text(
                        "Please type your email or phone number below and we can help you reset password",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius: BorderRadius.circular(13),
                        // border: Border.all(
                        //   // color: constance.secondary,
                        //   color: Theme.of(context).dividerColor,
                        // ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Email or Phone Number",
                          border: InputBorder.none,
                          hintStyle:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      height: 55,
                      text: 'Send',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.RESETPASS);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
