
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/OnBoarding/onboarding_controller.dart';
import 'package:mozaeapp/model/data/static/static.dart';

class Customcontrolls extends StatelessWidget {
  const Customcontrolls({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingContrllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onbordinglist.length,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 5),
                  duration: const Duration(microseconds: 900),
                  width: controller.currentPage == index ? 20 : 5,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Appcolor.basic,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
