import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/LogIn_View.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/views/OnBoarding_View.dart';
import 'package:fruits_e_commerce_app/Features/home/presentation/views/home_view.dart';
import 'package:fruits_e_commerce_app/core/Services/Firebase_Auth_Service.dart';
import 'package:fruits_e_commerce_app/core/Services/Firestore_Service.dart';
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
          SvgPicture.asset(Assets.images.freepikPlantInject63.path),
        ],
      ),
      SvgPicture.asset(Assets.images.a2g9aivNDMxq2VjIoppWWAdWqn89.path),
      SvgPicture.asset(Assets.images.freepikCirclesInject5.path,fit: BoxFit.fill,),
    ],
    );
  }

  void navigateToOnboarding() {
   bool isOnboardingSeen= Prefs.getBool(kIsOnboardingSeen);
  Future.delayed(Duration(seconds: 3),(){
    if(isOnboardingSeen)
      {
        var isLoggedIn=FirebaseAuthService().isLoggedIn();
        if(isLoggedIn){
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }else{
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      }
    else{
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    }
  });
  }
}
