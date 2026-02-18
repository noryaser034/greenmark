import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
    this.onChange,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChange;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: TextStyles.caption1,
        fillColor: AppColors.accentcolor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
      onChanged: onChange,
      onTap: onTap,
    );
  }
}
