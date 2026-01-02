import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/OnBoarding/onboarding_controller.dart';
import 'package:mozaeapp/model/data/static/static.dart';

class CustomSliderOnboarding extends GetView<OnBoardingContrllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        // print(value);
        controller.onPagechanged(value);
      },
      itemCount: onbordinglist.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Image.asset(
                onbordinglist[i].image!,
                width: 450,
                height: 300,
                // fit: BoxFit.fill,
              ),

              const SizedBox(height: 40),

              Text(
                onbordinglist[i].title!,
                // befure 20
                // style: Theme.of(context).textTheme.headlineLarge,
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Appcolor.basic,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onbordinglist[i].body!,
                  style: TextStyle(
                    fontFamily: "Cairo",
                    height: 2,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Appcolor.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
    );
  }
}
