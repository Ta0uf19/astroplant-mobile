import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const COLOR_WHITE = Colors.white;
const COLOR_BLACK = Colors.black;
const COLOR_GREY_DARK = Color.fromRGBO(29, 29, 29, 1.0);
const COLOR_GREY_MEDIUM = Color.fromRGBO(141, 141, 141, 1.0);
const COLOR_GREY_LIGHT = Color.fromRGBO(220, 220, 220, 1.0);
const COLOR_GREEN= Color.fromRGBO(53, 232, 124, 1.0);



const double kDefaultPadding = 20.0;

const double DEFAULT_PADDING_SIDES = 36.0;
const double DEFAULT_PADDING_SIDES_SMALL = 24.0;
const double DEFAULT_PADDING = 27.0;
const double DEFAULT_PADDING_SMALL = 13.0;

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    headline1: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 36),
    headline2: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 24),
    headline3: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 15),
    headline5: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 12,),
    bodyText1: TextStyle(
        color: COLOR_GREY_MEDIUM, fontSize: 18, fontWeight: FontWeight.w400,height: 1.5),
    bodyText2: TextStyle(
        color:  COLOR_GREY_MEDIUM, fontSize: 14, fontWeight: FontWeight.w400,height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_GREY_MEDIUM, fontSize: 16, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY_MEDIUM, fontSize: 12, fontWeight: FontWeight.w400));