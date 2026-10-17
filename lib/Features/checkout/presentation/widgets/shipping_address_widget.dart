import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce_app/Features/checkout/presentation/widgets/payment_item.dart';

import '../../../../core/utils/Text_Styles.dart';
import '../../../../generated/assets.dart';
import '../../domain/entities/order_entity.dart';


class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    log(context.read<OrderInputEntity>().toString());
    return PaymentItem(
      tile: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.images.location.path,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            ' ${context.read<OrderInputEntity>().shippingAddressEntity}',
            textAlign: TextAlign.right,
            style: Styles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.edit.path,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تعديل',
                    style: Styles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}