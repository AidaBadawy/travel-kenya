import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';

InputDecoration inputDecorationOne({
  required String hint,
  required Color enabledColor,
  required Color focusedColor,
  required Color errorColor,

  // required String labelText,
  // required Widget suffixIcon,
}) {
  return InputDecoration(
    // contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    hintText: hint,
    hintStyle: manropeRegular.copyWith(fontSize: 14, color: enabledColor),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: enabledColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: focusedColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: errorColor),
    ),
  );
}
