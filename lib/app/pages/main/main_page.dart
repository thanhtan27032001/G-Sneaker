import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsneaker/app/components/shoe_item.dart';
import 'package:gsneaker/app/configs/app_colors.dart';
import 'package:gsneaker/domain/shoe.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 600,
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
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ShoeItem(
                  shoe: Shoe(
                      name: "Nike Air Zoom Pegasus 36",
                      description:
                          "The iconic Nike Air Zoom Pegasus 36 offers more cooling "
                              "and mesh that targets breathability across high-heat areas. "
                              "A slimmer heel collar and tongue reduce bulk, "
                              "while exposed cables give you a snug fit at higher speeds.",
                    image: "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/air-zoom-pegasus-36-mens-running-shoe-wide-D24Mcz-removebg-preview.png",
                    color: "#e1e7ed"
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Container(
          width: 400,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.blackColor(),
          ),
        )
      ],
    );
  }
}
