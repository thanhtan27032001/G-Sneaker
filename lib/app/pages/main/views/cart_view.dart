import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsneaker/app/configs/app_colors.dart';

class CartView extends GetView {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blackColor(),
      ),
    );
  }

}