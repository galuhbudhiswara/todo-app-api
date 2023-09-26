// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFontLight extends StatelessWidget {
  const CustomFontLight({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.outfit(
          fontStyle: FontStyle.normal,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          backgroundColor: color,
        ));
  }
}

class CustomFontNormal extends StatelessWidget {
  const CustomFontNormal({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color,
    this.backgroundColor, this.align,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color? backgroundColor;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: align,
        style: GoogleFonts.outfit(
            fontStyle: FontStyle.normal,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
            backgroundColor: backgroundColor,
            color: color));
  }
}

class CustomFontBold extends StatelessWidget {
  const CustomFontBold({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.outfit(
          fontStyle: FontStyle.normal,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          backgroundColor: color,
        ));
  }
}
