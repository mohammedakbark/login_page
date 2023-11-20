import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/utils/colors.dart';

Widget customeTextField(
    {controller,
    String? labelText,
    Widget? icon,
    obsecure,
    String? Function(String?)? validator,
    void Function(String)? onSubmitted}) {
  return TextFormField(
    validator: validator,
    onFieldSubmitted: onSubmitted,
    obscureText: obsecure ?? false,
    controller: controller,
    decoration: InputDecoration(
      enabledBorder:
          const UnderlineInputBorder(borderSide: BorderSide(width: .2)),
      focusedBorder:
          const UnderlineInputBorder(borderSide: BorderSide(width: .2)),
      labelText: labelText,
      labelStyle: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w500, color: black),
      suffixIcon: icon,
    ),
  );
}
