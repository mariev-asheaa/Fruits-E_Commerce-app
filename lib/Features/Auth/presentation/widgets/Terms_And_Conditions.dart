import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/Features/Auth/presentation/widgets/Custom_CheckBox.dart';
import 'package:fruits_e_commerce_app/core/utils/Text_Styles.dart';


class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
final ValueChanged<bool>onChanged; //trigger if the check box is checked to allow sign up
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
         CustomCheckbox(
           isChecked: isTermsAccepted,
           onChanged: (bool value) {
           isTermsAccepted=value;
           widget.onChanged(value);
           setState(() {});
           },),
          const SizedBox(width: 16,),
          Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                        text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                        style: Styles.semiBoldW60013.copyWith(color: Color(0xFF949D9E))
                    ),
                    TextSpan(
                        text: 'الشروط\n والأحكام الخاصة بنا',
                        style: Styles.semiBoldW60013.copyWith(color: Color(0xFF2D9F5D),)
                    ),
                  ]
              )
          ),
        ],
      ),
    );
  }
}
