import 'package:flutter/material.dart';
import '../../../../core/utils/Text_Styles.dart';
import '../../../../core/utils/notification_widget.dart';
import '../../../../generated/assets.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const NotificationWidget(),
      leading: Image.asset(Assets.profileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: Styles.regular16.copyWith(
          color: const Color(0xFF949D9E),
        ),
      ),
      subtitle: Text(
        '',
        textAlign: TextAlign.right,
        style: Styles.bold16,
      ),
    );
  }
}