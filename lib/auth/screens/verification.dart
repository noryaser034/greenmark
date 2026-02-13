import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/core/widgets/timer.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  final String phoneNumber;

  const Verification({super.key, required this.phoneNumber});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

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
                    "Enter verification code",
                    style: TextStyles.title.copyWith(
                      color: AppColors.gray,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'We have sent a verification code to ',
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.graycolor,
                        ),
                      ),
                      Text(
                        widget.phoneNumber,
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 42),
                  Form(
                    child: Pinput(
                      keyboardType: TextInputType.number,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      controller: otpController,
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle: TextStyles.subtitle.copyWith(
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentcolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the verification code';
                        } else if (value.length < 4) {
                          return 'Please enter a valid 4-digit code';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Change Phone Number',
                        style: TextStyles.subtitle.copyWith(
                          color: AppColors.graycolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 27),
                  MainButton(
                    text: 'Confirm',
                    onpress: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: ResendTimer(durationSeconds: 83, onResend: () {}),
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
