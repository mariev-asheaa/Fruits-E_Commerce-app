import 'package:flutter/material.dart';

import '../../../../core/utils/Text_Styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.tile, required this.child});

  final String tile;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$tile:',
          style: Styles.bold13,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: child,
        ),
      ],
    );
  }
}