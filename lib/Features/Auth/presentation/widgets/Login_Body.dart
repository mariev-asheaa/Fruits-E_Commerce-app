import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/cubits/log_in_cubit.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Social_Media_Accounts.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/Error_Bar.dart';
import 'package:fruits_e_commerce_app/core/utils/Auth_Header.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_Button.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_TextFormField.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState>key=GlobalKey<FormState>();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  late String password,email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
  listener: (context, state) {
    if (state is LogInSuccess) {
      // Navigator.pushNamed(context, MainView.routeName);
    }
    if (state is LogInFailure) {
      showBar(context, state.errorMessage);
    }
  },
  builder: (context, state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const AuthHeader(title: 'تسجيل دخول', visible: false,),
             CustomTextFormField(
               onSaved: (value){
                 email=value!;
               },
               hinttext: 'البريد الإلكتروني', isSuffixVisible: false
               ,),
             CustomTextFormField(
               onSaved: (value){
                 password=value!;
               },
               hinttext: 'كلمة المرور',obsecure: true, isSuffixVisible: true,),
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
               child: CustomButton(text: 'تسجيل دخول', onTap: () {
                 if(key.currentState!.validate()){
                   key.currentState!.save();
                     context.read<LogInCubit>().userLogInWithEmailAndPassword(email, password);
                 }else{
                   setState(() {
                     autovalidateMode=AutovalidateMode.always;
                   });
                 }
               },),
             ),
             SocialMediaAccounts(),
           ],
          ),
        ),
      ),
    );
  },
);
  }
}
