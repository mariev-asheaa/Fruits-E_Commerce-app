import 'package:flutter/material.dart';

import '../../../../core/utils/Text_Styles.dart';
import '../../../best_selling_fruits/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: () => Navigator.pushNamed(context, BestSellingView.routeName),
      child: Row(
        children: [
          const Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: Styles.bold16,
          ),
          const Spacer(),
          GestureDetector(
            onTap:() =>Navigator.pushNamed(context, BestSellingView.routeName),
            child: Text(
              'المزيد',
              textAlign: TextAlign.center,
              style: Styles.regular13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
          )
        ],
      ),
    );
  }
}