import 'package:flutter/material.dart';
import 'package:greenmark/features/auth/screens/verification.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/features/auth/widgets/phone_text_form_filed.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.blackcolor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your mobile number",
                    style: TextStyles.title.copyWith(
                      color: AppColors.gray,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We need to verify you. We will send you a one time verification code.',
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.graycolor,
                    ),
                  ),
                  SizedBox(height: 42),
                  PhoneTextFormFiled(
                    controller: phoneController,
                    hintText: '01xxxxxxxxx',
                  ),
                  SizedBox(height: 32),
                  MainButton(
                    text: 'Next',
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        pushTo(
                          context,
                          Verification(phoneNumber: phoneController.text),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
