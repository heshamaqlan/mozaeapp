import 'package:flutter/material.dart';
import 'package:mozaeapp/content/approute.dart';
import 'package:mozaeapp/view/screen/Auth/forget_password.dart';
import 'package:mozaeapp/view/screen/Auth/login.dart';
import 'package:mozaeapp/view/screen/Home/main_home_screen.dart';
import 'package:mozaeapp/view/screen/OnBoarding/Onboarding_screen.dart';
import 'package:mozaeapp/view/screen/setting/Users/select_add_update_user.dart';
import 'package:mozaeapp/view/screen/setting/infomation/aboutscreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //onBoarding
  Approute.onBoarding: (context) => const OnboardingScreen(),
  //home
  Approute.home: (context) => Home(),

  //auth
  Approute.login: (context) => const Login(),
  // Approute.forgetPassword: (context) => const Forgetpassword(),

  //user
  Approute.users: (context) => const AddSelectUpdateDeleteUsers(),

  //abpoot
  Approute.about: (context) => const AboutScreen(),
};
