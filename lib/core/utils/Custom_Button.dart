import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,required this.onTap});
final String text;
 final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 15),
        decoration: ShapeDecoration(
          color:kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
          Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.semiBoldW60016.copyWith(color: Colors.white),
          )
          ],
        ),
      ),
    );
  }
}
