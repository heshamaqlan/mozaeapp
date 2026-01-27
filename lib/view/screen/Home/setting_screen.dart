import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/setting/settingcontroller.dart';
import 'package:mozaeapp/controller/theme/theme_controller.dart';
import 'package:mozaeapp/view/screen/setting/Users/select_add_update_user.dart';
import 'package:mozaeapp/view/widget/Setting/custom_sbottmsheet_image.dart';
import 'package:mozaeapp/view/widget/Setting/custom_image_header.dart';
import 'package:mozaeapp/view/widget/Setting/custom_line_setting.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AppearanceController());
    // final ThemeController controller = Get.find();
    final SettingcontrollerImp controller = Get.put(SettingcontrollerImp());
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
              //dark , light
              Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () {
                    // Get.bottomSheet(
                    //   Text("هشام هشام هشام"),
                    //   isScrollControlled: true,
                    //   barrierColor: Appcolor.black.withOpacity(0.4),
                    // );
                    print("هشام هشام هشام");
                    // CustomeSbottomsheet(title: "hesham",textbutton1: "hesham",);
                    Get.bottomSheet(
                      // Text("هشام هشام "),
                      CustomeSbottomsheet(
                        imagespathdark: 'assets/image/logo.png',
                        textdark: "ليلي",
                        isSelecteddark: true,
                        onTapdark: () {
                          print("dark");
                        },
                        imagespathlight: 'assets/image/logo.png',
                        textlight: "نهار",
                        isSelectedlight: true,
                        onTaplight: () {
                          print("light");
                        },
                      ),

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
              //language
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
              //recycle
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
              //information
              // Directionality(
              //   textDirection: TextDirection.rtl,
              //   child: InkWell(
              //     onTap: () {
              //       Get.bottomSheet(
              //         Text("hesham"),
              //         isScrollControlled: true,
              //         barrierColor: Appcolor.black.withOpacity(0.4),
              //       );
              //     },
              //     borderRadius: BorderRadius.circular(16),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomLineSetting(
                  icon: Icon(Icons.info_outline_rounded),
                  text: "معلومات التطبيق",
                  onTap: () {
                    controller.goToInformation();
                  },
                ),
              ),
              SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomLineSetting(
                  icon: Icon(Icons.info_outline_rounded),
                  text: "المستخدمين",
                  onTap: () {
                    controller.goToSelectAddUpdatescreen();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
