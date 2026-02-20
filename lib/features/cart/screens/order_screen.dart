import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/features/home/screens/home.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/chekout.svg",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                "Your Order has been accepted",
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Your items has been placcd and is on it’s way to being processed",
                style: TextStyles.caption1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              MainButton(
                text: "Go To Home",
                onpress: () {
                  setState(() {
                    pushTo(context, HomeScreen());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
