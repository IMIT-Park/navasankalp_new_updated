import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color kPrimaryColor = Color(0xFF407DF2);

  static MaterialColor appPrimarySwatch =
      MaterialColor(kPrimaryColor.value, <int, Color>{
    50: kPrimaryColor.withOpacity(0.1),
    100: kPrimaryColor.withOpacity(0.2),
    200: kPrimaryColor.withOpacity(0.3),
    300: kPrimaryColor.withOpacity(0.4),
    400: kPrimaryColor.withOpacity(0.5),
    500: kPrimaryColor.withOpacity(0.6),
    600: kPrimaryColor.withOpacity(0.7),
    700: kPrimaryColor.withOpacity(0.8),
    800: kPrimaryColor.withOpacity(0.9),
    900: kPrimaryColor.withOpacity(1.0),
  });

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color lightBlack = Color.fromARGB(52, 0, 0, 0);
  static const Color blue = Colors.blue;
  static const Color transparent = Color(0x00000000);
  static const Color green = Color(0xFF43A838);
  static const Color lightgreen = Color(0xFF23C920);
  static const Color red = Color(0xFFFF3B3B);
  static const Color darkred = Color(0xFFFF0000);
  static const Color grey = Color(0xFFAAAAAA);
  static const Color lightGray = Color(0xFF909296);
  static const Color orange = Color(0xFFF4934C);

  static const Color accountblue = Color.fromARGB(255, 36, 152, 238);
  static const Color colorDivider = Color(0xFFEBEBEB);
  static const Color blueAccent = Color(0xF427ACF8);
  static const Color neutral6 = Color(0xFFF1F2F9);
  static const Color neutral3 = Color(0xFFADAFC5);
  static const Color whiteGrey = Color(0xFFF3F0F0);
  static const Color lightBlue = Color(0xFF407DF2);

  static const LinearGradient linercolor = LinearGradient(
    colors: [
      Color.fromRGBO(248, 10, 199, 1),
      Color.fromRGBO(234, 12, 169, 1),
      Color.fromRGBO(254, 15, 69, 1),
      Color.fromRGBO(250, 115, 4, 1),
      Color.fromRGBO(254, 166, 5, 1),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  static const LinearGradient linercolors = LinearGradient(
    colors: [
      Color.fromARGB(255, 64, 200, 242), // #407DF2
      Color.fromARGB(255, 11, 0, 106), // #00246A
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(96.45 * 3.14 / 180),
  );
  static const Color myColor = Color.fromRGBO(41, 40, 117, 1);

  static const LinearGradient navasankalptextcolor = LinearGradient(
    colors: [
      Color(0xFF407DF2), // #407DF2
      Color(0xFF00246A), // #00246A
      myColor, // rgba(41, 40, 117, 1)
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    transform: GradientRotation(96.45 * 3.14 / 180),
  );

  static const LinearGradient accountgradiantcolor = LinearGradient(
    colors: [
      Color.fromARGB(255, 2, 185, 234),
      Color.fromARGB(255, 36, 152, 238),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
