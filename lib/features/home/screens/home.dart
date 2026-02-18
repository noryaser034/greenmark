import 'package:flutter/material.dart';
import 'package:greenmark/core/constants/app_images.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/widgets/custom_svg.dart';
import 'package:greenmark/core/widgets/custom_text_form_field.dart';
import 'package:greenmark/features/home/widgets/best_selleing.dart';
import 'package:greenmark/features/home/widgets/offer_builder.dart';
import 'package:greenmark/features/search/page/sarch_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: CustomSvg(
          path: AppImages.logosvg,
          color: AppColors.primary,
          width: 250,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Hero(
                tag: 'search',
                child: Material(
                  color: Colors.transparent,
                  child: CustomTextFormField(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search Store',
                    readOnly: true,
                    onTap: () {
                      pushTo(context, SarchScreen());
                    },
                  ),
                ),
              ),
              OfferBuilder(),
              BestSelling(),
              
            ],
          ),
        ),
      ),
    );
  }
}
