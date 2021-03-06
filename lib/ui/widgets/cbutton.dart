
import 'package:app/ui/widgets/ctoggle_widget.dart';
import 'package:app/ui/constants.dart';
import 'package:flutter/material.dart';

const defaultTextColor = CColors.black;
const defaultBackgroundColor = CColors.primary;
const double defaultHeight = 30;
const double defaultFontSize = 14.0;
const double defaultBorderRadius = 5.0;
const double defaultBorderWidth = 0.0;
const Color defaultBorderColor = Colors.transparent;

/// disabled (not selected) toggle style
const Color disabledColorBackground = Colors.transparent;
const Color disabledBorderColor = CColors.white;
const double disabledBorderWidth = 3.0;
const Color disabledColorText = CColors.white;

class CButton extends StatelessWidget implements IToggleable<CButton> {

  final String text;
  final Color colorBackground;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  EdgeInsetsGeometry padding;
  final Color borderColor;
  final Widget prefixIcon;
  final Icon suffixIcon;
  final Color splashColor;
  final bool activeToggle;
  final bool disabled;

  CButton({
    Key key,
    this.height = defaultHeight,
    this.width,
    @required this.onPressed,
    this.text,
    this.textStyle,
    this.padding ,
    this.colorBackground = defaultBackgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.borderWidth = defaultBorderWidth,
    this.borderColor = defaultBorderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.splashColor = CColors.white,
    this.activeToggle = false,
    this.disabled = false
  }) : super(key: key);

  /// Used for toggle active/disable state

  @override
  CButton copyWith({
    String text,
    Color colorText,
    Color colorBackground,
    double height,
    double width,
    VoidCallback onPressed,
    double fontSize,
    BorderRadiusGeometry borderRadius,
    double borderWidth,
    Color borderColor,
    Icon prefixIcon,
    Icon suffixIcon,
    Color splashColor,
    bool activeToggle,
    bool disabled,
  }) {
    if ((text == null || identical(text, this.text)) &&
        (colorBackground == null ||
            identical(colorBackground, this.colorBackground)) &&
        (height == null || identical(height, this.height)) &&
        (width == null || identical(width, this.width)) &&
        (onPressed == null || identical(onPressed, this.onPressed)) &&
        (borderRadius == null || identical(borderRadius, this.borderRadius)) &&
        (borderWidth == null || identical(borderWidth, this.borderWidth)) &&
        (borderColor == null || identical(borderColor, this.borderColor)) &&
        (prefixIcon == null || identical(prefixIcon, this.prefixIcon)) &&
        (suffixIcon == null || identical(suffixIcon, this.suffixIcon)) &&
        (splashColor == null || identical(splashColor, this.splashColor)) &&
        (activeToggle == null || identical(activeToggle, this.activeToggle)) &&
        (disabled == null || identical(disabled, this.disabled))) {
      return this;
    }

    return CButton(
      text: text ?? this.text,
      colorBackground: colorBackground ?? this.colorBackground,
      height: height ?? this.height,
      width: width ?? this.width,
      onPressed: onPressed ?? this.onPressed,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      borderColor: borderColor ?? this.borderColor,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      splashColor: splashColor ?? this.splashColor,
      activeToggle: activeToggle ?? this.activeToggle,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData themeData = Theme.of(context);
    // final Color colorText = (activeToggle ? defaultTextColor : (disabled ? disabledColorText : textStyle.color));

    return Container(
      child: FlatButton(
        splashColor: splashColor,
        color: activeToggle ? defaultBackgroundColor : (disabled ? disabledColorBackground : colorBackground),
        height: height,
        minWidth: width,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(
              color: activeToggle ? defaultBorderColor : (disabled ? disabledBorderColor : borderColor),
              width: activeToggle ? defaultBorderWidth : (disabled ? disabledBorderWidth : borderWidth),
              style: BorderStyle.solid
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixIcon ?? Container(),
            Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            suffixIcon ?? Container(),

          ],
        ),
      ),
    );
  }
}