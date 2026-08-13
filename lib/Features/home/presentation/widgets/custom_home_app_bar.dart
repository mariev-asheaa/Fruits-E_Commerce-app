import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/Helper_Functions/get_user.dart';
import '../../../../core/utils/Text_Styles.dart';
import '../../../../core/utils/notification_widget.dart';
import '../../../../generated/assets.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const NotificationWidget(),
      leading:Assets.images.profileImage.image(),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: Styles.regular16.copyWith(
          color: const Color(0xFF949D9E),
        ),
      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: Styles.bold16,
      ),
    );
  }
}