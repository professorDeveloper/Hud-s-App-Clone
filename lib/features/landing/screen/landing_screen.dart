import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../utils/colors.dart';
import '../../auth/screen/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome to Hud`sApp',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height / 15),
              Image.asset(
                'assets/bg.png',
                height: 340,
                width: 340,
                color: tabColor,
              ),
              SizedBox(height: size.height / 15),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                  style: TextStyle(color: greyColor),
                  textAlign: TextAlign.center,
                ),
              ),
                SizedBox(height: 10,),
                CustomButton(
                  text: 'AGREE AND CONTINUE',
                  onPressed: () {
                    // =>
                        navigateToLoginScreen(context);
                  },
                ),

            ],
          ),
        ),
      ),
    );
  }
}
