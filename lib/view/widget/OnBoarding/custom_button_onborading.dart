import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/OnBoarding/onboarding_controller.dart';

class CustomButtonOnborading extends GetView<OnBoardingContrllerImp> {
  const CustomButtonOnborading({
    super.key,
    required this.text,
    required this.hight,
    required this.wigth,
    required this.onpressed,
  });
  final String text;
  final double hight;
  final double wigth;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      onPressed: onpressed,
      // () {
      // controller.next();

      // },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      color: Appcolor.basic,
      // padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
      height: hight,
      minWidth: wigth,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
