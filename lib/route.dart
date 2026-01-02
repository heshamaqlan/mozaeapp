import 'package:flutter/material.dart';
import 'package:mozaeapp/content/approute.dart';
import 'package:mozaeapp/view/screen/Auth/forget_password.dart';
import 'package:mozaeapp/view/screen/Auth/login.dart';
import 'package:mozaeapp/view/screen/Home/main_home_screen.dart';
import 'package:mozaeapp/view/screen/OnBoarding/Onboarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //OnBoarding
  Approute.onBoarding: (context) => const OnboardingScreen(),
  //Home
  Approute.home: (context) => Home(),

  //Auth
  Approute.login: (context) => const Login(),
  Approute.forgetPassword: (context) => const Forgetpassword(),
};
