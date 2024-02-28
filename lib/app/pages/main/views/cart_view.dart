import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsneaker/app/components/cart_item.dart';
import 'package:gsneaker/app/configs/app_colors.dart';
import 'package:gsneaker/app/configs/app_text_style.dart';
import 'package:gsneaker/domain/shoe.dart';

class CartView extends GetView {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.whiteColor(),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              child: Image.asset(
                "/images/nike.png",
                height: 28,
                fit: BoxFit.fitWidth,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Text(
                  "Your cart",
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: AppTextStyle.fontSizeHeading3,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor()),
                ),
                const Spacer(),
                Text(
                  "\$268.23",
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: AppTextStyle.fontSizeHeading3,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor()),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartItem(
                  shoe: Shoe(
                      name: "Nike Air Zoom Pegasus 36",
                      description:
                          "The iconic Nike Air Zoom Pegasus 36 offers more cooling "
                          "and mesh that targets breathability across high-heat areas. "
                          "A slimmer heel collar and tongue reduce bulk, "
                          "while exposed cables give you a snug fit at higher speeds.",
                      image:
                          "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/air-zoom-pegasus-36-mens-running-shoe-wide-D24Mcz-removebg-preview.png",
                      color: "#e1e7ed"),
                );
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
