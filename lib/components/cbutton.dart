
import 'package:app/components/ctoggle_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

const defaultTextColor = COLOR_BLACK;
const defaultBackgroundColor = COLOR_GREEN;
const double defaultHeight = 30;
const double defaultFontSize = 14.0;
const double defaultBorderRadius = 5.0;
const double defaultBorderWidth = 0.0;
const Color defaultBorderColor = Colors.transparent;

/// disabled (not selected) toggle style
const Color disabledColorBackground = Colors.transparent;
const Color disabledBorderColor = Colors.white;
const double disabledBorderWidth = 3.0;
const Color disabledColorText = Colors.white;

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
    this.splashColor = Colors.white70,
    this.activeToggle = false,
    this.disabled = false
  }) : super(key: key);

  /// Used for toggle active/disable state

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

    return new CButton(
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
    final ThemeData themeData = Theme.of(context);
    final Color colorText = (activeToggle ? defaultTextColor : (disabled ? disabledColorText : this.textStyle.color));

    return Container(
      child: FlatButton(
        splashColor: this.splashColor,
        color: activeToggle ? defaultBackgroundColor : (disabled ? disabledColorBackground : this.colorBackground),
        height: this.height,
        minWidth: this.width,
        onPressed: this.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: this.borderRadius,
          side: BorderSide(
              color: activeToggle ? defaultBorderColor : (disabled ? disabledBorderColor : this.borderColor),
              width: activeToggle ? defaultBorderWidth : (disabled ? disabledBorderWidth : this.borderWidth),
              style: BorderStyle.solid
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            this.prefixIcon!= null ? prefixIcon : Container(),
            Text(
              this.text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            this.suffixIcon!= null ? suffixIcon : Container(),

          ],
        ),
      ),
    );
  }
}