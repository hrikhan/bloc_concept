import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Headings
  static TextStyle heading1({Color color = Colors.brown}) =>
      GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle heading2({Color color = Colors.brown}) =>
      GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle heading3({Color color = Colors.brown}) =>
      GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );

  // Subtitles
  static TextStyle subtitle({Color color = Colors.brown}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );

  // Body text
  static TextStyle body({Color color = Colors.brown}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle bodyBold({Color color = Colors.brown}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );

  // Small text
  static TextStyle small({Color color = Colors.brown}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: color,
  );
}
