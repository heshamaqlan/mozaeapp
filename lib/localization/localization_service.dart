import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService {
  static const _key = 'locale';
  static final GetStorage _box = GetStorage();

  static Locale getLocale() {
    final code = _box.read<String>(_key);
    if (code == 'ar') return const Locale('ar');
    if (code == 'en') return const Locale('en');
    // Default to Arabic if no locale is saved
    return const Locale('ar');
  }

  static Future<void> saveLocale(Locale locale) async {
    await _box.write(_key, locale.languageCode);
  }
}
