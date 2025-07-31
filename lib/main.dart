import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_e_commerce_app/Features/Splash/presentation/views/Splash_View.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/On_Genertated_Route.dart';
import 'package:fruits_e_commerce_app/core/Services/Shared_Preferences_Singleton.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
