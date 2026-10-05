import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/LogIn_View.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/views/OnBoarding_View.dart';
import 'package:fruits_e_commerce_app/Features/home/presentation/views/main_view.dart';
import 'package:fruits_e_commerce_app/core/Services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/core/Services/shared_preferences_singleton.dart';
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
          Navigator.pushReplacementNamed(context, MainView.routeName);
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
