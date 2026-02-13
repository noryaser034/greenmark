import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmark/core/constants/app_images.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/intro/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // delay of 3 seconds before navigating to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(context, const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: SvgPicture.asset(AppImages.logosvg)),
    );
  }
}
