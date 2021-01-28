import 'package:app/util/constants.dart';
import 'package:flutter/material.dart';

const Color defaultColorBackground = Colors.white;
const double defaultWidth = null;
const double defaultHeight = 120;
const double defaultBorderRadius = 20;
const double defaultPadding = 16.0;

class CCard extends StatelessWidget {
  CCard({
    Key key,
    this.colorBackground = defaultColorBackground,
    this.width = defaultWidth,
    this.height = defaultHeight,
    @required this.onPressed,
    this.borderRadius = defaultBorderRadius,
    this.padding = defaultPadding,
    this.body,
    this.suffixWidget,
  }) : super(key: key);

  final Color colorBackground;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final double borderRadius;
  final double padding;
  final Widget body;
  final Widget suffixWidget;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: COLOR_BLACK,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: colorBackground,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          child: Row(children: [
            Expanded(child: Padding(
              padding: EdgeInsets.all(padding),
              child: body != null ? body : Container(),
            )),
            suffixWidget != null ? suffixWidget : Container(),
          ]),
        ),
      ),
    );
  }


}
