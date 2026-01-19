import 'package:flutter/material.dart';
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
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            hintText: hintText,
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
                      item,
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
          // لتجنب الأخطاء عند تحديث القائمة
          isExpanded: true,
        ),
      ),
    );
    // const SizedBox(height: 20),
  }
}
