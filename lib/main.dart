import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mozaeapp/controller/theme/theme_controller.dart';
import 'package:mozaeapp/db/core/config/firebase_options.dart';
import 'package:mozaeapp/route.dart';
import 'package:mozaeapp/test.dart';
import 'package:mozaeapp/view/screen/Home/setting_screen.dart';
import 'package:mozaeapp/view/screen/OnBoarding/Onboarding_screen.dart';
import 'package:mozaeapp/view/screen/setting/Users/select_add_update_user.dart';
import 'package:mozaeapp/localization/app_translation.dart';
import 'package:mozaeapp/localization/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Localization configuration
      translations: AppTranslation(),
      // Use device locale if supported; fallback to English
      locale: LocalizationService.getLocale(),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const OnboardingScreen(),
      routes: routes,
    );
  }
}
