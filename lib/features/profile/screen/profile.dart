import 'package:flutter/material.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/features/auth/screens/signup_screen.dart';
import 'package:greenmark/features/profile/widget/account_option.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/nour.jpg'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nourhan Yaser Fathy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nourhan_Yaser@gmail.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.edit, color: Colors.green),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Divider(),
                  AccountOption(
                    imagePath: 'assets/icons/Orders_icon.png',
                    title: 'Orders',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/My_Details_icon.png',
                    title: 'My Details',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/Delicery_address.png',
                    title: 'Delivery Address',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/Vector_icon.png',
                    title: 'Payment Methods',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/Promo_Cord_icon.png',
                    title: 'Promo Cord',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/Bell_icon.png',
                    title: 'Notifications',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/help_icon.png',
                    title: 'Help',
                  ),
                  AccountOption(
                    imagePath: 'assets/icons/about_icon.png',
                    title: 'About',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  pushTo(context, SignUpScreen());
                },
                icon: const Icon(Icons.logout),
                label: const Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[50],
                  foregroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
