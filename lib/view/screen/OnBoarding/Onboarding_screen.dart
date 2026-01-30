import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/OnBoarding/onboarding_controller.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_contriller.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_slider_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
  OnBoardingContrllerImp controller =  Get.put(OnBoardingContrllerImp());
    return Scaffold(
      backgroundColor: Appcolor.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Expanded(flex: 2, child: CustomSliderOnboarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Customcontrolls(),
                  const SizedBox(height: 80),
                  CustomButtonOnborading(
                    onpressed: () {
                       controller.next();
                    },
                    text: 'continue',
                    wigth: 220,
                    hight: 55,
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
