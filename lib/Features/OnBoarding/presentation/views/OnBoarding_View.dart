import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/widgets/OnBoarding_Body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
static const routeName='Onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnboardingBody()),
    );
  }
}
