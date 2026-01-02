import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/approute.dart';
import 'package:mozaeapp/model/data/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPagechanged(int index);
}

class OnBoardingContrllerImp extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage + 1 > onbordinglist.length) {
      Get.offNamed(Approute.login);
      // print("hesham");
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPagechanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
