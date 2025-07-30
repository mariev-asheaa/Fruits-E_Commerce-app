import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/views/OnBoarding_View.dart';
import 'package:fruits_e_commerce_app/Features/Splash/presentation/views/Splash_View.dart';

Route<dynamic>onGeneratedRoute(RouteSettings settings)
{
  switch(settings.name)
      {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context)=>SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context)=>OnboardingView());

    default:
      return MaterialPageRoute(builder: (context)=>Scaffold());
  }
}