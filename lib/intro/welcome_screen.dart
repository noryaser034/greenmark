import 'package:flutter/material.dart';
import 'package:greenmark/auth/screens/login_screen.dart';
import 'package:greenmark/core/constants/app_images.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/main_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            //image
            Image.asset(
              AppImages.welcome,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            //content
            Positioned(
              bottom: 70,
              right: 20,
              left: 20,
              child: Column(
                children: [
                  Image.asset(AppImages.carrot, color: AppColors.background),
                  SizedBox(height: 35),
                  Text(
                    "Welcome \nto Our Store",
                    textAlign: TextAlign.center,
                    style: TextStyles.title.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Get your groceries in as fast as one hour",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                  SizedBox(height: 20),

                  MainButton(
                    text: "Get Started",
                    onpress: () {
                      pushReplacement(context, LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
