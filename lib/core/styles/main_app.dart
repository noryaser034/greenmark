import 'dart:io';
import 'package:flutter/material.dart';
import 'package:greenmark/core/constants/app_fonts.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/features/intro/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: child ?? Container(),
        );
      },
      home: const SplashScreen(),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      fontFamily: AppFonts.poppins,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        onSurface: AppColors.blackcolor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          foregroundColor: AppColors.background,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.gray,
        backgroundColor: Colors.transparent,
        selectedLabelStyle: TextStyles.caption1.copyWith(
          fontWeight: FontWeight.w600,
          height: 2,
        ),
        unselectedLabelStyle: TextStyles.caption2.copyWith(
          fontWeight: FontWeight.w600,
          height: 2,
        ),
        elevation: 0,
      ),
    );
  }
}
