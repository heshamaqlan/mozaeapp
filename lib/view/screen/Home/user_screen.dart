import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/view/widget/Setting/custom_image_header.dart';
import 'package:mozaeapp/view/widget/Setting/custom_line_setting.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.background,
      body: Column(
        children: [
          //header
          CustomImageHeader(),
          SizedBox(height: 50),
          // Text(
          //   "الاعدادات",
          //   style: TextStyle(
          //     fontFamily: "Cairo",
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          SizedBox(height: 20),

          //line
          Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Text("hesham"),
                      isScrollControlled: true,
                      barrierColor: Appcolor.black.withOpacity(0.4),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: CustomLineSetting(
                    icon: Icon(Icons.dark_mode_rounded),
                    text: "المظهـــر",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Text("hesham"),
                      isScrollControlled: true,
                      barrierColor: Appcolor.black.withOpacity(0.4),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: CustomLineSetting(
                    icon: Icon(Icons.language_rounded),
                    text: "اللغـــة",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Text("hesham"),
                      isScrollControlled: true,
                      barrierColor: Appcolor.black.withOpacity(0.4),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: CustomLineSetting(
                    icon: Icon(Icons.delete_forever_rounded),
                    text: "سلة المحذوفات",
                  ),
                ),
              ),
              SizedBox(height: 20),

              Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Text("hesham"),
                      isScrollControlled: true,
                      barrierColor: Appcolor.black.withOpacity(0.4),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: CustomLineSetting(
                    icon: Icon(Icons.info_outline_rounded),
                    text: "معلومات التطبيق",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
