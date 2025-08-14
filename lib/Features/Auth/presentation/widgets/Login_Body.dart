import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Social_Media_Accounts.dart';
import 'package:fruits_e_commerce_app/core/utils/Auth_Header.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_Button.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_TextFormField.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const AuthHeader(title: 'تسجيل دخول', visible: false,),
           CustomTextFormField(hinttext: 'البريد الإلكتروني', isSuffixVisible: false,),
           CustomTextFormField(hinttext: 'كلمة المرور',obsecure: true, isSuffixVisible: true,),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Text(
                 'نسيت كلمة المرور؟',
                 style: Styles.semiBoldW60013.copyWith(color: kSecondaryColor)
               ),
             ],
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 33),
             child: CustomButton(text: 'تسجيل دخول', onTap: () {  },),
           ),
           SocialMediaAccounts(),
         ],
        ),
      ),
    );
  }
}
