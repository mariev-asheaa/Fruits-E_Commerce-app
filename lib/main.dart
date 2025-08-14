import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_e_commerce_app/Features/Splash/presentation/views/Splash_View.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/On_Genertated_Route.dart';
import 'package:fruits_e_commerce_app/core/Services/Get_It_Service.dart';
import 'package:fruits_e_commerce_app/core/Services/Shared_Preferences_Singleton.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';
import 'package:fruits_e_commerce_app/firebase_options.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  await Prefs.init();
   setupGetIt();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor)
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
     home: SplashView(),
      onGenerateRoute: onGeneratedRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
