import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.visible});
final String title;
final bool visible;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:24,top: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text(
              title,style: Styles.bold19),
          ),
          Expanded(child: SizedBox()),
          Visibility(
            visible:visible,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFF1F1F5),
                    ),
                  ),
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
