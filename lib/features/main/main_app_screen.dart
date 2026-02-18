import 'package:flutter/material.dart';
import 'package:greenmark/core/constants/app_images.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/widgets/custom_svg.dart';
import 'package:greenmark/features/cart/screens/cart_screen.dart';
import 'package:greenmark/features/explor/page/explor_screen.dart';
import 'package:greenmark/features/favourite/screens/favourite_screen.dart';
import 'package:greenmark/features/home/screens/home.dart';
import 'package:greenmark/features/profile/screen/profile.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ExplorScreen(),
    CartScreen(),
    FavoritePage(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff555E58).withValues(alpha: .1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            //Home
            BottomNavigationBarItem(
              icon: CustomSvg(path: AppImages.storesvg),
              activeIcon: CustomSvg(
                path: AppImages.storesvg,
                color: AppColors.primary,
              ),
              label: 'Shop',
            ),
            //Explore
            BottomNavigationBarItem(
              icon: CustomSvg(path: AppImages.explorsvg),
              activeIcon: CustomSvg(
                path: AppImages.explorsvg,
                color: AppColors.primary,
              ),
              label: 'Explore',
            ),
            //cart
            BottomNavigationBarItem(
              icon: CustomSvg(path: AppImages.carsvg),
              activeIcon: CustomSvg(
                path: AppImages.carsvg,
                color: AppColors.primary,
              ),
              label: 'Cart',
            ),
            //favourite
            BottomNavigationBarItem(
              icon: CustomSvg(path: AppImages.heartsvg),
              activeIcon: CustomSvg(
                path: AppImages.heartsvg,
                color: AppColors.primary,
              ),
              label: 'Favourite',
            ),
            //account
            BottomNavigationBarItem(
              icon: CustomSvg(path: AppImages.usersvg),
              activeIcon: CustomSvg(
                path: AppImages.usersvg,
                color: AppColors.primary,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
