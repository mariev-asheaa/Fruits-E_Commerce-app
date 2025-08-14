import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';
import 'package:fruits_e_commerce_app/generated/assets.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.isChecked, required this.onChanged});
final bool isChecked;
final ValueChanged<bool>onChanged;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
      onChanged(!isChecked);
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
        width: 24,
        height: 24,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color:isChecked? kPrimaryColor:Colors.white ,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked?Colors.transparent:const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child:isChecked? Padding(
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(Assets.iconsCheck),
        ):SizedBox(),
      ),
    );
  }
}
