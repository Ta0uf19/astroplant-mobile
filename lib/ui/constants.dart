import 'package:flutter/material.dart';

// Custom color palettes
class CColors {
  // make class non-instantiable
  CColors._();

  static const primary = Color.fromRGBO(53, 232, 124, 1.0);
  static const white = Colors.white;
  static const black = Colors.black;
  static const greyDark = Color.fromRGBO(29, 29, 29, 1.0);
  static const greyMedium = Color.fromRGBO(141, 141, 141, 1.0);
  static const greyLight = Color.fromRGBO(220, 220, 220, 1.0);

  // card colors
  static const cardInactive = Color(0xFF30363E);
  static const cardGradient1 = Color(0xff27ED76);
  static const cardGradient2 = Color(0xff0DBF54);

  // shimmer colors
  static const shimmerBaseColor = Color(0xFF30363E);
  static const shimmerHighlightColor = Color(0xFF5a6069);

}

// Custom dimensions
class CPadding {
  // make class non-instantiable
  CPadding._();

  static const double defaultSides = 36.0;
  static const double defaultSidesSmall = 24.0;
  static const double defaultPadding = 27.0;
  static const double defaultSmall = 13.0;
}

class CFontFamily {
  CFontFamily._();

  static const String larsseit = 'Larsseit';
  // static const String productSans = 'ProductSans';
  // static const String roboto = 'Roboto';
}

// Dark theme
final ThemeData themeData =  ThemeData(
  primaryColor: CColors.black,
  backgroundColor: CColors.black,
  accentColor: CColors.primary,
  textTheme: textTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: CFontFamily.larsseit
);

// Light theme
// Not implemented

final TextTheme textTheme = TextTheme(
    headline1: TextStyle(
        color: CColors.white, fontWeight: FontWeight.w700, fontSize: 36),
    headline2: TextStyle(
        color: CColors.white, fontWeight: FontWeight.w700, fontSize: 24),
    headline3: TextStyle(
        color: CColors.white, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: CColors.white, fontWeight: FontWeight.w700, fontSize: 15),
    headline5: TextStyle(
        color: CColors.white, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
      color: CColors.white,
      fontWeight: FontWeight.w700,
      fontSize: 12,
    ),
    bodyText1: TextStyle(
        color: CColors.greyMedium,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.5),
    bodyText2: TextStyle(
        color: CColors.greyMedium,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5),
    subtitle1: TextStyle(
        color: CColors.greyMedium,
        fontSize: 16,
        fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: CColors.greyMedium,
        fontSize: 12,
        fontWeight: FontWeight.w400));
