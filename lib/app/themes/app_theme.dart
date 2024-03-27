import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData themData = ThemeData(
    primarySwatch: AppColors.appPrimarySwatch,
    primaryColor: AppColors.kPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
