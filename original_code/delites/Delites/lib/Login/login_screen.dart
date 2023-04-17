// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api
import 'package:delites/constance/constance.dart' as constance;
import 'package:delites/constance/theme.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: 14, left: 14, bottom: 0, top: 0),
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Hero(
              tag: 'appIcon',
              child: Image.asset(constance.ConstanceData.AppLogo, height: 100)),
          SizedBox(height: 8),
          Text(
            "Delites",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text(
            "Welcome back",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Sign in to continue",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Theme.of(context).dividerColor,
            ),
            child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Email or Phone Number",
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey))),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: TextFormField(
              obscureText: hidePass,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, top: 16),
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey),
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
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.FORGOT);
                  },
                  child: Text("Forgot password",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor))),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          CustomButton(
              height: 50,
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, Routes.INTRODUCTIONSCREEN1);
              },
              text: "Sign In"),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey,
                  height: 1,
                  child: Text("data"),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Or",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  height: 1,
                  child: Text("data"),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: HexColor("#0041a7"),
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 24),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: HexColor("#40a8f9"),
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {},
                  )),
              SizedBox(width: 24),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: HexColor("#ef2103"),
                  child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.googlePlusG,
                        color: Colors.white, size: 20),
                    onPressed: () {},
                  )),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You don't have an account?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
              SizedBox(width: 4),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.SINGIN);
                },
                child: Text("Sign Up",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }

  bool hidePass = true;
}
