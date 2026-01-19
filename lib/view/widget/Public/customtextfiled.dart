// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mozaeapp/content/appcolor.dart';

// class Customtextfiled extends StatelessWidget {
//   const Customtextfiled({
//     super.key,
//     this.colors,
//     this.onChanged,
//     required this.hintText,
//     this.lableText,
//     this.validator,
//     this.prefixicon,
//     required this.suffixicon,
//     this.obscureText = false,
//     this.controller,
//     this.readOnly = false,
//     this.keyboardType,
//     this.inputFormatters,
//   });
//   final TextEditingController? controller;
//   final Appcolor? colors;
//   final void Function(String)? onChanged;
//   final String? lableText;
//   final String hintText;
//   final String? Function(String?)? validator;
//   final IconButton? prefixicon;
//   final Icon suffixicon;
//   final bool? obscureText;
//   final bool readOnly;
//   final TextInputType? keyboardType;
//   final List<TextInputFormatter>? inputFormatters;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           // lableText,
//           if (lableText != null)
//             Text(
//               lableText!,
//               style: TextStyle(
//                 color: Appcolor.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 fontFamily: "Cairo",
//               ),
//             ),

//           SizedBox(height: 12),

//           TextFormField(
//             textDirection: TextDirection.rtl,
//             validator: validator,
//             obscureText: obscureText!,
//             readOnly: readOnly,
//             keyboardType: keyboardType,
//             inputFormatters: inputFormatters,
//             decoration: InputDecoration(
//               // prefixIcon: prefixicon,
//               prefixIcon: prefixicon,
//               suffixIcon: suffixicon,
//               filled: true,
//               fillColor:
//                   readOnly
//                       ? Appcolor.background.withOpacity(0.7)
//                       : Appcolor.background,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(color: Appcolor.basic),
//               ),

//               hintText: hintText,
//               hintStyle: TextStyle(fontFamily: "Cairo"),
//               hintTextDirection: TextDirection.rtl,
//             ),
//             onChanged: readOnly ? null : onChanged,
//             controller: controller,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mozaeapp/content/appcolor.dart';

enum FieldType { text, number, decimal, phone, date, readonly }

class Customtextfiled extends StatelessWidget {
  const Customtextfiled({
    super.key,
    required this.hintText,
    required this.suffixicon,
    required this.fieldType,
    this.controller,
    this.onChanged,
    this.onTap,
  });

  final String hintText;
  final Icon suffixicon;
  final FieldType fieldType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;

  /// ===== إعدادات حسب النوع =====
  TextInputType get _keyboardType {
    switch (fieldType) {
      case FieldType.number:
        return TextInputType.number;
      case FieldType.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case FieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? get _inputFormatters {
    switch (fieldType) {
      case FieldType.text:
        return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zء-ي\s]'))];
      case FieldType.number:
        return [FilteringTextInputFormatter.digitsOnly];
      case FieldType.decimal:
        return [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))];
      case FieldType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(9),
        ];
      default:
        return null;
    }
  }

  String? Function(String?)? get _validator {
    return (value) {
      if (value == null || value.isEmpty) return null;

      switch (fieldType) {
        case FieldType.text:
          if (RegExp(r'\d').hasMatch(value)) {
            return "يرجى إدخال نص فقط";
          }
          break;

        case FieldType.number:
          if (int.tryParse(value) == null) {
            return "يرجى إدخال رقم صحيح فقط";
          }
          break;

        case FieldType.decimal:
          if (double.tryParse(value) == null) {
            return "يرجى إدخال رقم عشري صحيح";
          }
          break;

        case FieldType.phone:
          if (value.length < 9) {
            return "رقم الهاتف غير صحيح";
          }
          break;

        default:
          break;
      }
      return null;
    };
  }

  bool get _readOnly =>
      fieldType == FieldType.date || fieldType == FieldType.readonly;

  bool get _enabled => fieldType != FieldType.readonly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: controller,
        textDirection: TextDirection.rtl,
        keyboardType: _keyboardType,
        inputFormatters: _inputFormatters,
        validator: _validator,
        readOnly: _readOnly,
        enabled: _enabled,
        onChanged: _readOnly ? null : onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          filled: true,
          fillColor:
              _readOnly
                  ? Appcolor.background.withOpacity(0.6)
                  : Appcolor.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Appcolor.basic),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
