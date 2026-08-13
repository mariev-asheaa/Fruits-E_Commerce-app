import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/cubits/log_in_cubit.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/SignUp_View.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Social_Media_Button.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';
import 'package:fruits_e_commerce_app/generated/assets.dart';
import '../../../../core/utils/app_colors.dart';

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
                  style:Styles.semiBold16.copyWith(color:  Color(0xFF949D9E),)
                ),
                TextSpan(
                  text: ' ',
                ),
                TextSpan(
                  text: 'قم بانشاء حساب',
                  style:Styles.semiBold16.copyWith(color:AppColors.primaryColor,),
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
                  style:Styles.semiBold16.copyWith(color:Color(0xFF949D9E),)
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
        SocialMediaButton(text: 'تسجيل بواسطة جوجل', image: Assets.icons.google.path,
          onTap: () {
          context.read<LogInCubit>().googleSignIn();
          },),
       Platform.isIOS? SocialMediaButton(text: 'تسجيل بواسطة أبل', image: Assets.icons.apple.path, onTap: () {
          context.read<LogInCubit>().appleSignIn();
        },):SizedBox(),

        SocialMediaButton(text: 'تسجيل بواسطة فيسبوك', image: Assets.icons.facebook.path,
          onTap: () {
          context.read<LogInCubit>().facebookSignIn();
        },),
      ],
    );
  }
}
