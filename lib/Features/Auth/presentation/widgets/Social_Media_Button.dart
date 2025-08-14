import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.text, required this.image});

  final String text,image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: ShapeDecoration(
          color:Colors.white,
          shape: RoundedRectangleBorder(
          side: BorderSide(
                 width: 1,
                color: const Color(0xFFDCDEDE),
              ),
              borderRadius: BorderRadius.circular(16),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(image),
            Padding(
              padding: const EdgeInsets.only(right: 66),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style:Styles.semiBoldW60016
              ),
            )
          ],
        ),
      ),
    );
  }
}
