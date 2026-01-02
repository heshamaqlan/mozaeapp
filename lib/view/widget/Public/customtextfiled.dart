import 'package:flutter/material.dart';
import 'package:mozaeapp/content/appcolor.dart';

class Customtextfiled extends StatelessWidget {
  const Customtextfiled({
    super.key,
    this.colors,
    this.onChanged,
    required this.hintText,
    this.lableText,
    this.validator,
    this.prefixicon,
    required this.suffixicon,
    this.obscureText = false,
    this.controller,
  });
  final TextEditingController? controller;
  final Appcolor? colors;
  final void Function(String)? onChanged;
  final String? lableText;
  final String hintText;
  final String? Function(String?)? validator;
  final IconButton? prefixicon;
  final Icon suffixicon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // lableText,
          if (lableText != null)
            Text(
              lableText!,
              style: TextStyle(
                color: Appcolor.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: "Cairo",
              ),
            ),

          SizedBox(height: 12),

          TextFormField(
            
            textDirection: TextDirection.rtl,
            validator: validator,
            obscureText: obscureText!,
            decoration: InputDecoration(
              // prefixIcon: prefixicon,
              prefixIcon: prefixicon,
              suffixIcon: suffixicon,
              filled: true,
              fillColor: Appcolor.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Appcolor.basic),
              ),

              hintText: hintText,
              hintStyle: TextStyle(fontFamily: "Cairo"),
              hintTextDirection: TextDirection.rtl,
              
            ),
            onChanged: onChanged,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
