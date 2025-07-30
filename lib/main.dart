import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Splash/presentation/views/Splash_View.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/On_Genertated_Route.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: SplashView(),
      onGenerateRoute: onGeneratedRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
