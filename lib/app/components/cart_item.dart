import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gsneaker/app/configs/app_colors.dart';
import 'package:gsneaker/app/configs/app_text_style.dart';
import 'package:gsneaker/domain/cart_item_data.dart';
import 'package:gsneaker/domain/shoe.dart';

class CartItem extends StatelessWidget {
  final Shoe shoe;
  final CartItemData cartItem;
  final void Function()? onRemoveItemButtonClick;
  final void Function()? onAddItemButtonClick;
  final void Function()? onMinusItemButtonClick;

  const CartItem(
      {super.key,
      required this.shoe,
      required this.cartItem,
      required this.onRemoveItemButtonClick,
      this.onAddItemButtonClick,
      this.onMinusItemButtonClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: shoe.getShoeColor(),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 16,
                      offset: const Offset(5, 5),
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8, bottom: 24),
              child: Transform.rotate(
                  angle: -pi / 8,
                  child: Image.network(
                    shoe.image ?? "",
                    width: 120,
                    height: 120,
                    fit: BoxFit.fitWidth,
                  )),
            )
          ],
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoe.name ?? "",
                style: TextStyle(
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                    fontSize: AppTextStyle.fontSizeBody2,
                    color: AppColors.blackColor()),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "\$ ${(shoe.price! * cartItem.amount).toStringAsFixed(2)}",
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                      fontSize: AppTextStyle.fontSizeHeading4,
                      color: AppColors.blackColor()),
                ),
              ),
              Row(
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.black12,
                      child: InkWell(
                        onTap: onMinusItemButtonClick,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.remove, size: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      cartItem.amount.toString(),
                      style: TextStyle(
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                          fontSize: AppTextStyle.fontSizeBody2,
                          color: AppColors.blackColor()),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.black12,
                      child: InkWell(
                        onTap: onAddItemButtonClick,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.add, size: 16),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ClipOval(
                    child: Material(
                      color: AppColors.yellowColor(),
                      child: InkWell(
                        onTap: onRemoveItemButtonClick,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset("images/trash.png", width: 16,),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
