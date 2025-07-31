import 'package:flutter/cupertino.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/models/PageView_Item_Model.dart';
import 'package:fruits_e_commerce_app/Features/OnBoarding/presentation/widgets/Onboarding_PageView_Item.dart';
import 'package:fruits_e_commerce_app/generated/assets.dart';

class OnboardingPageview extends StatelessWidget {
  const OnboardingPageview({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        //first page view
        OnboardingPageviewItem(
          isVisible: true,
          pageViewModel: PageViewModel(
            backGroundImange: Assets.imagesVector,
            image: Assets.basketAmico,
            subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: Text.rich(
              TextSpan(
                 children: [
             TextSpan(
             text: 'مرحبًا بك في',
             style: TextStyle(
               color: const Color(0xFF0C0D0D),
               fontSize: 28,
               fontWeight: FontWeight.w700,
             ),
                        ),
                TextSpan(
             text: ' Fruit',
             style: TextStyle(
               color: const Color(0xFF1B5E37),
               fontSize: 28,
               fontWeight: FontWeight.w700,
             ),),
              TextSpan(
             text: 'HUB',
             style: TextStyle(
               color: const Color(0xFFF4A91F) ,
               fontSize: 28,
               fontWeight: FontWeight.w700,
             ),
            ),],)
            )
        ),
        ),

        //Second page view
        OnboardingPageviewItem(
          isVisible: false,
          pageViewModel: PageViewModel(
            backGroundImange: Assets.imagesVector2,
            image: Assets.imagesPineappleCuate,
            subTitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ابحث وتسوق',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0C0D0D) ,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
        ),
        )
      ],
    );
  }
}
