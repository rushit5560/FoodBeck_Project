// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:delites/constance/constance.dart' as constance;

import '../main.dart';

class IntroductionScreen1 extends StatefulWidget {
  const IntroductionScreen1({Key? key}) : super(key: key);

  @override
  _IntroductionScreen1State createState() => _IntroductionScreen1State();
}

class _IntroductionScreen1State extends State<IntroductionScreen1> {
  final PageController _pageController = PageController();
  int initalPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 14, left: 14),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: initalPage == 0
                          ? Theme.of(context).primaryColor
                          : constance.secondary.withOpacity(0.3),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: initalPage == 1
                          ? Theme.of(context).primaryColor
                          : constance.secondary.withOpacity(0.3),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: initalPage == 2
                          ? Theme.of(context).primaryColor
                          : constance.secondary.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              flex: 6,
              child: PageView(
                controller: _pageController,
                onPageChanged: (number) {
                  setState(() {
                    initalPage = number;
                  });
                },
                children: [
                  firstIntroduction(),
                  firstIntroduction(),
                  firstIntroduction(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget firstIntroduction() {
    return Column(
      children: [
        Image.asset(
          initalPage == 0
              ? ConstanceData.intro1
              : initalPage == 1
                  ? ConstanceData.intro2
                  : ConstanceData.intro3,
          height: 200,
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          initalPage == 0
              ? "Online Shopping"
              : initalPage == 1
                  ? "Detailed Recipes"
                  : "Ship at Your Home",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 18,
        ),
        Padding(
          padding: EdgeInsets.only(right: 14, left: 14),
          child: Text(
            initalPage == 0
                ? "You can shopping anytime,anywhere\nthat you want"
                : initalPage == 1
                    ? "if you are wondering what to cook today. don't\nworry because we have a list for you."
                    : "The productsyou order will be\ndelivered to your address",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
        ),
        Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IntroductionScreen1(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: CustomButton(
                height: 50,
                onPressed: () {
                  if (initalPage == 0) {
                    _pageController.jumpToPage(1);
                  } else if (initalPage == 1) {
                    _pageController.jumpToPage(2);
                  } else {
                    Navigator.pushReplacementNamed(context, Routes.CHOOSETOPIC);
                  }
                },
                text: "Shopping Now"),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom + defaultPadding,
        ),
      ],
    );
  }
}
