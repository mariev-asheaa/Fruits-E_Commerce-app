import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/SignUp_View.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Social_Media_Button.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';
import 'package:fruits_e_commerce_app/generated/assets.dart';

class SocialMediaAccounts extends StatelessWidget {
  const SocialMediaAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 78,bottom: 33,left: 78),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'لا تمتلك حساب؟',
                  style:Styles.semiBoldW60016.copyWith(color:  Color(0xFF949D9E),)
                ),
                TextSpan(
                  text: ' ',
                ),
                TextSpan(
                  text: 'قم بانشاء حساب',
                  style:Styles.semiBoldW60016.copyWith(color:kPrimaryColor,),
                  recognizer: TapGestureRecognizer()..onTap=(){
                    Navigator.pushNamed(context, SignupView.routeName);
                  }
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: const Color(0xFFDCDEDE),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'أو',
                  style:Styles.semiBoldW60016.copyWith(color:Color(0xFF949D9E),)
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: const Color(0xFFDCDEDE),
                ),
              ),
            ],
          ),
        ),
        SocialMediaButton(text: 'تسجيل بواسطة جوجل', image: Assets.iconsGoogle,),
        SocialMediaButton(text: 'تسجيل بواسطة أبل', image: Assets.iconsApple,),
        SocialMediaButton(text: 'تسجيل بواسطة فيسبوك', image: Assets.iconsFacebook,),
      ],
    );
  }
}
