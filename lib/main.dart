import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:fruits_e_commerce_app/Features/Splash/presentation/views/Splash_View.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/On_Genertated_Route.dart';
import 'package:fruits_e_commerce_app/core/Services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/Services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce_app/firebase_options.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

import 'Features/home/presentation/cubits/bottom_nav_cubit.dart';
import 'Features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'core/utils/app_colors.dart';


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  await Prefs.init();
   setupGetIt();
   runApp(
     MultiBlocProvider(
       providers: [
         BlocProvider(
           create: (context) => BottomNavCubit(),
         ),
         BlocProvider(
           create: (context) => CartCubit(),
         ),
       ],
       child: const FruitsHub(),
     ),
   );
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilPlusInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        autoRebuild: false, builder: (context, child) {
        return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)
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
    );
  }
}
