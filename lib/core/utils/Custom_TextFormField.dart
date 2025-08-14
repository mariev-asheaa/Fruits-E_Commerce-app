import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {

  CustomTextFormField({super.key, this.onchanged,this.hinttext,this.obsecure=false,this.onSaved, required this.isSuffixVisible});
  Function(String)?onchanged;
  final void Function(String?)? onSaved;
  final String? hinttext;
  bool ?obsecure;
final bool isSuffixVisible;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: widget.obsecure!,
        onSaved:widget.onSaved,
        validator:(data){
          if(data!.isEmpty){
            return 'This field is required';
          }
          return null;
        } ,

        onChanged: widget.onchanged,
        decoration: InputDecoration(
            fillColor: kTextFieldColor,
            filled: true,
            suffixIcon: Visibility(
              visible:widget.isSuffixVisible,
              child: IconButton(
                icon: Icon(
                  widget.obsecure! ? Icons.visibility : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  setState(() {
                    widget.obsecure= !widget.obsecure!;
                  });
                },
              ),
            ),
            hintText: widget.hinttext,
            suffixIconColor: Color(0xFF949D9E).withValues(alpha: .3),
            hintStyle: const TextStyle(fontSize: 16,color: Color(0xFF949D9E),fontFamily:'Cairo'),

            enabledBorder:  OutlineInputBorder(
                borderRadius:BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFE6E9E9),
                )
            ),
            focusedBorder:  OutlineInputBorder(
                borderRadius:BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFE6E9E9),
                )
            )
        ),
      ),
    );
  }
}

