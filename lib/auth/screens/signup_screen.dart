import 'package:flutter/material.dart';
import 'package:greenmark/auth/screens/login_screen.dart';
import 'package:greenmark/auth/screens/number.dart';
import 'package:greenmark/core/constants/app_images.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/functions/validation.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/custom_text_form_field.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/core/widgets/password_text_form_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(AppImages.carrot, height: 80)),
                  SizedBox(height: 40),
                  Text("Sign Up", style: TextStyles.title),
                  SizedBox(height: 16),
                  //title
                  Text(
                    'Enter your credentials to continue',
                    style: TextStyles.caption1.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 32),
                  //Name
                  Text(
                    'Name',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.graycolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: "Nourhan Yaser",
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),

                  //email
                  Text(
                    'ُEmail',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.graycolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: "example@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  //password
                  SizedBox(height: 16),
                  Text(
                    'Password',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.graycolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  PasswordTextFormFiled(
                    hintText: '******',
                    keyboardType: TextInputType.visiblePassword, validator: (value) {
                  if (value == null || value.isEmpty) {
                 return 'Please enter your password';
                 } else if (value.length < 8) {
                   return 'Password must be at least 8 characters';
                 }
                 return null;
                },
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},

                      child: Text(
                        'Forgot password?',
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  MainButton(
                    text: 'Sign Up',
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        pushReplacement(context, NumberScreen());
                      }
                      
                    },
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyles.caption1.copyWith(
                              color: AppColors.blackcolor,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              onPressed: () {
                                pushReplacement(context, LoginScreen());
                              },
                              child: Text(
                                'Login',
                                style: TextStyles.caption1.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
