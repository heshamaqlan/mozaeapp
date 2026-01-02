import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/Home/navigations_controller.dart';
import 'package:mozaeapp/view/screen/Home/categories_screen.dart';
import 'package:mozaeapp/view/screen/Home/customers_screen.dart';
import 'package:mozaeapp/view/screen/Home/product_details_screen.dart';
import 'package:mozaeapp/view/screen/Home/user_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final NavigationControllerImp controller = Get.put(NavigationControllerImp());

  final List<Widget> pages = const [
    CategoriesScreen(),
    ProductDetailsScreen(),
    CustomersScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationControllerImp>(
      builder:
          (_) => Scaffold(
            backgroundColor: Appcolor.background,
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: pages[controller.currentpage],
            ),

            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Appcolor.basic,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.25),
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GNav(
                gap: 8,
                selectedIndex: controller.currentpage,
                onTabChange: controller.changeIndex,

                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),

                tabBackgroundColor: Appcolor.background,
                activeColor: Appcolor.basic,
                color: Colors.white,

                tabs: const [
                  GButton(
                    icon: Icons.category,
                    text: 'الاصناف',
                    textStyle: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    // style: GnavStyle.google,
                  ),
                  GButton(
                    icon: Icons.info_outline,
                    text: 'تفاصيل الصنف',
                    textStyle: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GButton(
                    icon: Icons.people,
                    text: 'الزبائن',
                    textStyle: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  GButton(
                    icon: Icons.verified_user,
                    text: 'قسم المستخدمين',
                    textStyle: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
