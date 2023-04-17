// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:delites/Constance/constance.dart';
import 'package:delites/Constance/theme.dart';
import 'package:delites/main.dart';
import 'package:delites/widget/common_button.dart';
import 'package:flutter/material.dart';

class ChoosetopicScreen extends StatefulWidget {
  const ChoosetopicScreen({Key? key}) : super(key: key);

  @override
  _ChoosetopicScreenState createState() => _ChoosetopicScreenState();
}

class _ChoosetopicScreenState extends State<ChoosetopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 14, right: 14),
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 50,
          ),
          Text(
            "Choose Topics",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "You can choose topics and we have\nsuggest suitable products for you",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topic("#59c2e9", ConstanceData.fruits, "Fruits"),
              topic("#f5f6f8", ConstanceData.meat, "Meat"),
              topic("#9f9093", ConstanceData.healthy, "Healthy"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topic("#fafafc", ConstanceData.snack, "Snack"),
              topic("#ded586", ConstanceData.vegetable, "Vegetable"),
              topic("#dbe6fa", ConstanceData.fish, "Fish"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topic("#85c0d6", ConstanceData.drink, "Drink"),
              topic("#264057", ConstanceData.nuts, "Nuts"),
              topic("#fdb26a", ConstanceData.medicne, "Medicine"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            height: 50,
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.HOME);
            },
            text: "Done",
          ),
        ],
      ),
    );
  }

  Widget topic(String color, String image, String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: HexColor(
              color,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              height: 80,
              width: 80,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
