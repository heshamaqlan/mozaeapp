import 'package:get/get.dart';

abstract class NavigationController extends GetxController {
  changeIndex(int index);
}

class NavigationControllerImp extends NavigationController {
  int currentpage = 0;

  @override
  changeIndex(int index) {
    currentpage = index;
    update();
  }
}
