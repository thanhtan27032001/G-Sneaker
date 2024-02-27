import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gsneaker/app/components/text/app_text.dart';
import 'package:gsneaker/app/configs/app_colors.dart';
import 'package:gsneaker/app/configs/app_text_style.dart';
import 'package:gsneaker/domain/shoe.dart';

class ShoeItem extends StatelessWidget {
  final Shoe shoe;

  const ShoeItem({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 32, right: 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Color(int.parse("0xff${shoe.color?.replaceAll("#", "")}")),
          ),
          child: Transform.rotate(
            angle: -pi / 8,
            child: Image.network(shoe.image ?? ""),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 32, bottom: 24),
            child: Text(
              shoe.name ?? "",
              style: TextStyle(
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.bold,
                  fontSize: AppTextStyle.fontSizeHeading3,
                  color: AppColors.blackColor()),
            )),
        Text(
          shoe.description ?? "",
          style: TextStyle(
              fontFamily: "Rubik",
              fontSize: AppTextStyle.fontSizeBody2,
              height: 1.5,
              color: AppColors.grayColor()),
        ),
        Container(
          margin: const EdgeInsets.only(top: 24, bottom: 80),
          child: Row(
            children: [
              Text(
                "\$ ${shoe.price ?? "Not found"}",
                style: TextStyle(
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                    fontSize: AppTextStyle.fontSizeBody1,
                    color: AppColors.blackColor()),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowColor()),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                        fontSize: AppTextStyle.fontSizeBody2,
                        color: AppColors.blackColor()),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
