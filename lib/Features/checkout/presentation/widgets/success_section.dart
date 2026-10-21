import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce_app/core/utils/Custom_Button.dart';

import '../../../../core/utils/Text_Styles.dart';
import '../../../../generated/assets.dart';
import '../../../home/domain/entities/cart_entity.dart';
import '../../../home/presentation/cubits/bottom_nav_cubit.dart';
import '../../../home/presentation/cubits/cart_cubit/cart_cubit.dart';

class SuccessSection extends StatelessWidget {
  const SuccessSection({super.key, required this.orderId, required this.cartEntity});

  final String orderId;
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.group34011.path),
          SizedBox(height: 33),
          Text('تم بنجاح !', style: Styles.bold16,),
          SizedBox(height: 9,),
          Text('رقم الطلب: $orderId', style: Styles.regular13,),
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'تتبع الطلب', onTap: () {}),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              context.read<CartCubit>().clearCart();
              context.read<BottomNavCubit>().changeIndex(0);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text('الرئيسية', style: Styles.bold16.copyWith(
              decoration: TextDecoration.underline,
            ),),
          ),
        ],
      ),
    );
  }
}
