import 'package:flutter/material.dart';

import '../../../../core/utils/Text_Styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.text});

  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(
            index,
            style: Styles.semiBold13,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Styles.semiBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        )
      ],
    );
  }
}