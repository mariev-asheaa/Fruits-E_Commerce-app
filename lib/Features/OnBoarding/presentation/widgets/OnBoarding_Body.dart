import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/LogIn_View.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/widgets/Onboarding_PageView.dart';
import 'package:fruits_e_commerce_app/core/Services/Shared_Preferences_Singleton.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_Button.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController pageController;
  var currentPageIndex=0;
  @override
  void initState() {
    pageController=PageController();
    pageController.addListener((){
      currentPageIndex=pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
   pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnboardingPageview(pageController: pageController,)),

        DotsIndicator(
            dotsCount: 2,
        decorator: DotsDecorator(
          activeColor: kPrimaryColor,
          color:currentPageIndex==1?kPrimaryColor:kSecondaryColor
        ),
        ),
        SizedBox(height: 29,),

        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,//all is used to maintain the size of the button even when it is invisible
          visible: currentPageIndex==1?true:false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child:CustomButton(text:'ابدأ الان',
              onTap: () {
              Prefs.setBool(kIsOnboardingSeen, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },),
          ),
        ),
        SizedBox(height: 43,),
      ],
    );
  }
}
