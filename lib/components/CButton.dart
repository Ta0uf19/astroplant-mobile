import 'package:flutter/material.dart';

const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
const COLOR_GREY = Color.fromRGBO(141, 141, 141, 1.0);
const COLOR_GREEN = Color.fromRGBO(53, 239, 127, 1.0);

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

  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Icon prefixIcon;
  final Icon suffixIcon;

  CButton({
    Key key,
    this.height = defaultHeight,
    this.width = defaultWidth,
    this.onPressed,
    this.text,
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
    return FlatButton(
      color: this.colorBackground,
      height: this.height,
      minWidth: this.width,
      onPressed: this.onPressed,

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
        children: [
          this.prefixIcon!= null ? prefixIcon : Container(),
          Text(
            this.text,
            style: TextStyle(color: this.colorText, fontSize: this.fontSize),
          ),
          this.suffixIcon!= null ? suffixIcon : Container(),

        ],
      ),
    );
  }
}
