// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new, duplicate_ignore, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:delites/widget/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController dob = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, Routes.LOGIN);
        return true;
      },
      child: Scaffold(
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
                      Navigator.pushReplacementNamed(context, Routes.LOGIN);
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
                      "Sign Up",
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
                        "Please type your information below",
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
                          borderRadius: BorderRadius.circular(13),
                          color: Theme.of(context).dividerColor
                          // border: Border.all(
                          //   color: constance.secondary,
                          // ),
                          ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Full Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Theme.of(context).dividerColor

                          // border: Border.all(
                          //   color: constance.secondary,
                          // ),
                          ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          // border: Border.all(
                          //   color: constance.secondary,
                          // ),
                          color: Theme.of(context).dividerColor),
                      child: TextFormField(
                        obscureText: hidePass,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, top: 16),
                          border: InputBorder.none,
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            child: Icon(
                              hidePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColor,
                            ),
                            onTap: () => {
                              setState(() => hidePass = !hidePass),
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Theme.of(context).dividerColor

                          // border: Border.all(
                          //   color: constance.secondary,
                          // ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Theme.of(context).dividerColor

                          // border: Border.all(
                          //   color: constance.secondary,
                          // ),
                          ),
                      child: TextFormField(
                        controller: dob,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, top: 16),
                          border: InputBorder.none,
                          hintText: 'Date of Birth',
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            onTap: () {
                              CupertinoRoundedDatePicker.show(
                                context,
                                initialDatePickerMode:
                                    CupertinoDatePickerMode.date,
                                minimumYear: 1960,
                                background:
                                    Theme.of(context).scaffoldBackgroundColor,
                                maximumYear: DateTime.now().year,
                                borderRadius: 16,
                                onDateTimeChanged: (newtime) {
                                  setState(() {
                                    String formattedDate =
                                        DateFormat('dd/M/yyyy').format(newtime);
                                    dob.text = formattedDate;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      height: 55,
                      text: 'Send',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.INTRODUCTIONSCREEN1);
                      },
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You don't have an account?",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.LOGIN);
                          },
                          child: Text(
                            "Sign In",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 16,
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

  bool hidePass = true;
}
