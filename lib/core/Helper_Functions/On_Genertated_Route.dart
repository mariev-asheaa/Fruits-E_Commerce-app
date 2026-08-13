import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/LogIn_View.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/SignUp_View.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/views/OnBoarding_View.dart';
import 'package:fruits_e_commerce_app/Features/Splash/presentation/views/Splash_View.dart';

import '../../Features/best_selling_fruits/best_selling_view.dart';
import '../../Features/home/presentation/views/home_view.dart';

Route<dynamic>onGeneratedRoute(RouteSettings settings)
{
  switch(settings.name)
      {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context)=>SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context)=>OnboardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context)=>LoginView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context)=>SignupView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context)=>HomeView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context)=>BestSellingView());

    default:
      return MaterialPageRoute(builder: (context)=>Scaffold());
  }
}