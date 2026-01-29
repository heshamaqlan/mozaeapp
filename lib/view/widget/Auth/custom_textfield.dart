import 'package:flutter/material.dart';
import 'package:mozaeapp/content/appcolor.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.onChanged,
    required this.hintText,
    required this.lableText,
    this.validator,
    this.prefixicon,
    this.suffixicon,
    this.obscureText = false,
    this.controller,
  });

  final void Function(String)? onChanged;
  final String lableText;
  final String hintText;
  final String? Function(String?)? validator;
  final IconButton? prefixicon;
  final Icon? suffixicon;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            lableText,
            style: const TextStyle(
              color: Appcolor.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Cairo",
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: controller,
            textDirection: TextDirection.rtl,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixicon,
              suffixIcon: suffixicon,
              filled: true,
              fillColor: Appcolor.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Appcolor.basic),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(fontFamily: "Cairo"),
              hintTextDirection: TextDirection.rtl,
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
