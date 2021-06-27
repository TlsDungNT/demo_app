import 'package:demo_app/utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget myTextField(
    {TextEditingController? controller,
      required TextInputType keyboradType,
      required TextCapitalization textCapitalization,
      required int maxLengthInput,
      bool obscureText = false,
      String? hintText,
      IconData? suffixIcon,
      VoidCallback? onTapSufixIcon}) {
  return Container(
    height: 64,
    child: TextField(
      controller: controller,
      autocorrect: false,
      keyboardType: keyboradType,
      textCapitalization: textCapitalization,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLengthInput)],
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainPurple),
          ),
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: () {
              if (onTapSufixIcon != null) {
                onTapSufixIcon();
              }
            },
            child: Icon(suffixIcon),
          )
              : null),
    ),
  );
}

