import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/cubits/sign_up_cubit.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Terms_And_Conditions.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/Error_Bar.dart';
import 'package:fruits_e_commerce_app/core/utils/Auth_Header.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_Button.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_TextFormField.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final GlobalKey<FormState>key=GlobalKey<FormState>();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  late String userName,password,email;
  late bool isTermsAccepted=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
         // Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SignUpFailure) {
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
                children: [
                  AuthHeader(title: 'حساب جديد', visible: true,),
                  CustomTextFormField(hinttext: 'الاسم كامل',
                    onSaved: (value){
                    userName=value!;
                  }, isSuffixVisible: false,
                  ),
                  CustomTextFormField(hinttext: 'البريد الإلكتروني',
                    onSaved: (value){
                      email=value!;
                    }, isSuffixVisible: false,
                  ),
                  CustomTextFormField(hinttext: 'كلمة المرور',
                      obsecure: true,
                    onSaved: (value){
                      password=value!;
                    }, isSuffixVisible: true,
                  ),
                  TermsAndConditions(
                    onChanged: (bool value) {
                    isTermsAccepted=value;
                    },),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: CustomButton(text: 'إنشاء حساب جديد', onTap: () {
                      if(key.currentState!.validate()){
                        key.currentState!.save();
                        if(isTermsAccepted){
                          context.read<SignUpCubit>().createUserWithEmailAndPassword(email, password, userName);
                        }
                        else{
                          showBar(context, 'يجب الموافقه على الشروط و الاحكام');
                        }
                           }else{
                        setState(() {
                          autovalidateMode=AutovalidateMode.always;
                        });
                      }
                    },),
                  ),
                  Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                                text: 'تمتلك حساب بالفعل؟ ',
                                style: Styles.semiBoldW60016.copyWith(color: Color(0xFF949D9E))
                            ),
                            TextSpan(
                                text: 'تسجيل دخول',
                                style:  Styles.semiBoldW60016.copyWith(color: kPrimaryColor),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  Navigator.pop(context);
                                }
                            ),
                          ]
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
