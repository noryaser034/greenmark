import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onpress});
  final String text;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyles.button.copyWith(color: AppColors.background),
      ),
    );
  }
}
