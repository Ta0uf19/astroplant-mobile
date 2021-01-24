import 'package:app/constants.dart';
import 'package:flutter/material.dart';


const defaultTextColor = COLOR_BLACK;
const defaultBackgroundColor = COLOR_GREEN;
const double defaultHeight = 56;
const double defaultWidth = double.infinity;
const double defaultFontSize = 18;
const double defaultBorderRadius = 28;
const double defaultBorderWidth = 0;
const Color defaultBorderColor = Colors.transparent;

class CButton extends StatelessWidget {
  final String text;
  final Color colorText;
  final Color colorBackground;
  final double height;
  final double width;
  final VoidCallback onPressed;

  final double fontSize;
  final TextStyle textStyle;
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  EdgeInsetsGeometry padding;
  final Color borderColor;
  final Widget prefixIcon;
  final Icon suffixIcon;

  CButton({
    Key key,
    this.height = defaultHeight,
    this.width = defaultWidth,
    this.onPressed,
    this.text,
    this.textStyle,
    this.padding ,
    this.fontSize = defaultFontSize,
    this.colorText = defaultTextColor,
    this.colorBackground = defaultBackgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.borderWidth = defaultBorderWidth,
    this.borderColor = defaultBorderColor,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return FlatButton(
      color: this.colorBackground,
      height: this.height,
      minWidth: this.width,
      onPressed: this.onPressed,
      padding: this.padding == null ? EdgeInsets.only(right: 16,left: 16) : this.padding,
      shape: RoundedRectangleBorder(
        borderRadius: this.borderRadius,
        side: BorderSide(
            color: this.borderColor,
            width: this.borderWidth,
            style: BorderStyle.solid
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          this.prefixIcon!= null ? prefixIcon : Container(),
          Text(
            this.text,
            style: textStyle == null ?themeData.textTheme.headline3.copyWith(color: colorText) : textStyle.copyWith(color: colorText),
          ),
          this.suffixIcon!= null ? suffixIcon : Container(),

        ],
      ),
    );
  }
}
