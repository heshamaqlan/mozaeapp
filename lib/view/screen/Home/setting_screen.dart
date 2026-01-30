import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/setting/settingcontroller.dart';
import 'package:mozaeapp/db/core/services/firebase_user_service.dart';
import 'package:mozaeapp/model/data/user_model.dart';
import 'package:mozaeapp/view/widget/Setting/custom_image_header.dart';
import 'package:mozaeapp/view/widget/Setting/custom_line_setting.dart';
import 'package:mozaeapp/view/widget/Setting/custom_sbottmsheet_image.dart';
import 'package:mozaeapp/localization/localization_service.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingcontrollerImp controller = Get.put(SettingcontrollerImp());

    final FirebaseUserService userService = FirebaseUserService();

    return Scaffold(
      backgroundColor: Appcolor.background,
      body: FutureBuilder<AppUser?>(
        future: userService.getCurrentUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final AppUser currentUser = snapshot.data!;
          final bool isAdmin = currentUser.role == 'admin';

          return Column(
            children: [
              /// Header
              CustomImageHeader(),
              const SizedBox(height: 40),

              Column(
                children: [
                  /// المظهر
                  Directionality(
                    textDirection: (Get.locale?.languageCode == 'ar')
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          CustomeSbottomsheet(
                            imagespathdark: 'assets/image/dark.png',
                            textdark: 'dark'.tr,
                            isSelecteddark: Get.locale?.languageCode == 'ar',
                            onTapdark: () {},
                            imagespathlight: 'assets/image/light.png',
                            textlight: 'light'.tr,
                            isSelectedlight: Get.locale?.languageCode != 'ar',
                            onTaplight: () {},
                          ),
                          isScrollControlled: true,
                          barrierColor: Appcolor.black.withOpacity(0.4),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: CustomLineSetting(
                        icon: Icon(Icons.dark_mode_rounded),
                        text: 'appearance',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// اللغة
                  Directionality(
                    textDirection: (Get.locale?.languageCode == 'ar')
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          CustomeSbottomsheet(
                            imagespathdark: 'assets/image/arbic.png',
                            textdark: 'arabic'.tr,
                            isSelecteddark: Get.locale?.languageCode == 'ar',
                            onTapdark: () {
                              Get.updateLocale(const Locale('ar'));
                              // persist
                              LocalizationService.saveLocale(const Locale('ar'));
                              Get.back();
                            },
                            imagespathlight: 'assets/image/english.png',
                            textlight: 'english'.tr,
                            isSelectedlight: Get.locale?.languageCode == 'en',
                            onTaplight: () {
                              Get.updateLocale(const Locale('en'));
                              // persist
                              LocalizationService.saveLocale(const Locale('en'));
                              Get.back();
                            },
                          ),
                          isScrollControlled: true,
                          barrierColor: Appcolor.black.withOpacity(0.4),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: CustomLineSetting(
                        icon: Icon(Icons.language_rounded),
                        text: 'language',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Directionality(
                    textDirection: (Get.locale?.languageCode == 'ar')
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: CustomLineSetting(
                      icon: const Icon(Icons.delete_forever_rounded),
                      text: 'trash',
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(height: 20),

                  Directionality(
                    textDirection: (Get.locale?.languageCode == 'ar')
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: CustomLineSetting(
                      icon: const Icon(Icons.info_outline_rounded),
                      text: 'about_app',
                      onTap: () {
                        controller.goToInformation();
                      },
                    ),
                  ),

                  if (isAdmin) ...[
                    const SizedBox(height: 20),
                    Directionality(
                      textDirection: (Get.locale?.languageCode == 'ar')
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: CustomLineSetting(
                        icon: const Icon(Icons.group),
                        text: 'users',
                        onTap: () {
                          controller.goToSelectAddUpdatescreen();
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
