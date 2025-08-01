import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/LogIn_View.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/views/OnBoarding_View.dart';
import 'package:fruits_e_commerce_app/core/Services/Shared_Preferences_Singleton.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';
import 'package:fruits_e_commerce_app/generated/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToOnboarding();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(Assets.imagesFreepikPlantInject63),
        ],
      ),
      SvgPicture.asset(Assets.images2g9aivNDMxq2VjIoppWWAdWqn89),
      SvgPicture.asset(Assets.imagesFreepikCirclesInject5,fit: BoxFit.fill,),
    ],
    );
  }

  void navigateToOnboarding() {
   bool isOnboardingSeen= Prefs.getBool(kIsOnboardingSeen);
  Future.delayed(Duration(seconds: 3),(){
    if(isOnboardingSeen)
      {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    else{
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    }
  });
  }
}
