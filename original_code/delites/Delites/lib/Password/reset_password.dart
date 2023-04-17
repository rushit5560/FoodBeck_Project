// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../main.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Reset Password",
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
                      "And now,you can your new password and confirm it below",
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
                      color: Theme.of(context).dividerColor,
                      // border: Border.all(
                      //   color: Theme.of(context).dividerColor,
                      //   // color: constance.secondary,
                      // ),
                    ),
                    child: TextFormField(
                      obscureText: hidePass,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 16),
                        border: InputBorder.none,
                        hintText: 'New Password',
                        hintStyle:
                            Theme.of(context).textTheme.headline1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey,
                                ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            hidePass ? Icons.visibility_off : Icons.visibility,
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
                      color: Theme.of(context).dividerColor,
                      // border: Border.all(
                      //   color: Theme.of(context).dividerColor,
                      //   // color: constance.secondary,
                      // ),
                    ),
                    child: TextFormField(
                      obscureText: confhidePass,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 16),
                        border: InputBorder.none,
                        hintText: 'Confirm New Password',
                        hintStyle:
                            Theme.of(context).textTheme.headline1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey,
                                ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            confhidePass
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () => {
                            setState(() => confhidePass = !confhidePass),
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.VERIFICATION);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          "Reset Password",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool hidePass = true;
  bool confhidePass = true;
}
