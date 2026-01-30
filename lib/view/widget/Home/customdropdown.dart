import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
// import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart'; // غير مستخدم

class Customdropdown extends StatelessWidget {
  const Customdropdown({
    super.key,
    // this.labelText,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
  });
  // final String? labelText;
  final String hintText;
  final String? value;
  final List<String> items;
  final void Function(String?)? onChanged;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Directionality(
        textDirection:
            (Get.locale?.languageCode == 'ar') ? TextDirection.rtl : TextDirection.ltr,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintTextDirection: (Get.locale?.languageCode == 'ar')
                ? TextDirection.rtl
                : TextDirection.ltr,
            hintText: hintText.tr,
            hintStyle: TextStyle(fontFamily: "Cairo"),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: Appcolor.background,
          ),
          value: value,
          items:
              items.map((String item) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.centerRight,
                  value: item,
                  // child: Text(item),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      item.tr,
                      style: TextStyle(
                        fontFamily: "Cairo",
                        color: Appcolor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
          onChanged: onChanged,
          
          isExpanded: true,
        ),
      ),
    );
    // const SizedBox(height: 20),
  }
}
