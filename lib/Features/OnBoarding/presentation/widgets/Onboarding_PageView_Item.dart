import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/views/LogIn_View.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/models/PageView_Item_Model.dart';
import 'package:fruits_e_commerce_app/core/Services/Shared_Preferences_Singleton.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';


class OnboardingPageviewItem extends StatelessWidget {
  const OnboardingPageviewItem({super.key, required this.pageViewModel,required this.isVisible});
final PageViewModel pageViewModel;
final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.5,
          width: double.infinity,
          child: Stack(
            children: [
            Positioned.fill(
                child: SvgPicture.asset(pageViewModel.backGroundImange,fit: BoxFit.fill,)
            ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SvgPicture.asset(pageViewModel.image)
              ),
              Visibility(
                visible: isVisible,
                child: InkWell(
            onTap: (){
              Prefs.setBool(kIsOnboardingSeen, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF949D9E),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 64,),
        pageViewModel.title,
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            pageViewModel.subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF4E5556),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.70,
            ),
          ),
        ),
      ],
    );
  }
}
