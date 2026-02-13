import 'package:flutter/material.dart';
import 'package:greenmark/auth/screens/number.dart';
import 'package:greenmark/auth/screens/signup_screen.dart';
import 'package:greenmark/core/constants/app_images.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/functions/validation.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/custom_text_form_field.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/core/widgets/password_text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  Text("Login", style: TextStyles.title),
                  SizedBox(height: 16),
                  //title
                  Text(
                    'Enter your email and password',
                    style: TextStyles.caption1.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 32),
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
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
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
                    text: 'Login',
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
                            text: 'Don\'t have an account? ',
                            style: TextStyles.caption1.copyWith(
                              color: AppColors.blackcolor,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              onPressed: () {
                                pushTo(context, SignUpScreen());
                              },
                              child: Text(
                                'Sign up',
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
