// Copyright (c) 2021 Taoufik Tribki. All rights reserved.

import 'package:app/ui/constants.dart';
import 'package:flutter/material.dart';

const Color primaryColor = CColors.primary;
const Color defaultColor = CColors.greyMedium;
const Color defaultOnSelectColor = CColors.white;
const Color defaultBackground = Color(0xFF1B1E2F);
const double defaultSizeIcon = 30.0;

class CBottomNav extends StatefulWidget {
  final int index;
  final void Function(int i) onTap;
  final List<CBottomNavItem> items;
  final IconStyle iconStyle;
  final Color backgroundColor;
  final Color color;

  CBottomNav({
    this.index,
    this.onTap,
    this.items,
    this.iconStyle,
    this.backgroundColor = defaultBackground,
    this.color = primaryColor
  }) :
        assert(items != null),
        assert(items.length >= 2);

  @override
  CBottomNavState createState() => CBottomNavState();
}

class CBottomNavState extends State<CBottomNav> {
  int currentIndex;
  IconStyle iconStyle;
  double itemWidth;

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    iconStyle = widget.iconStyle ?? IconStyle();
    itemWidth = (MediaQuery.of(context).size.width) / widget.items.length;

    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5)
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                  color: Colors.transparent,
                  width: currentIndex == 0 ? MediaQuery.of(context).size.width * 0.0 : itemWidth * currentIndex,
                  height: 4.0,
                ),
                Flexible(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                    width: itemWidth * 0.6,
                    height: 4.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: itemWidth * 0.2,
                    ),
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: widget.items.map((b) {
                final int i = widget.items.indexOf(b);
                final bool selected = i == currentIndex;

                return BMNavItem(
                  icon: b.icon,
                  iconSize: selected ? iconStyle.getSelectedSize() : iconStyle.getSize(),
                  onTap: () => onItemClick(i),
                  color: selected ? iconStyle.getSelectedColor() : iconStyle.getColor(),
                );
              }).toList(),
            ),
          ],
        )
    );
  }

  onItemClick(int i) {
    setState(() {
      currentIndex = i;
    });
    if (widget.onTap != null) widget.onTap(i);
  }
}

class CBottomNavItem {
  final IconData icon;
  CBottomNavItem(this.icon);
}

class IconStyle {
  final double size;
  final double onSelectSize;
  final Color color;
  final Color onSelectColor;

  IconStyle({this.size, this.onSelectSize, this.color, this.onSelectColor});

  double getSize() {
    return size ?? defaultSizeIcon;
  }

  double getSelectedSize() {
    return onSelectSize ?? size ?? defaultSizeIcon;
  }

  Color getColor() {
    return color ?? defaultColor;
  }

  Color getSelectedColor() {
    return onSelectColor ?? defaultOnSelectColor;
  }
}

class BMNavItem extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final void Function() onTap;
  final Color color;
  final TextStyle textStyle;

  BMNavItem({
    this.icon,
    this.iconSize,
    this.onTap,
    this.color,
    this.textStyle,
  }) :
        assert(icon != null),
        assert(iconSize != null),
        assert(color != null),
        assert(onTap != null);

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: InkResponse(
          key: key,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, (56-iconSize)/2, 0.0, (56-iconSize)/2),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(icon, size: iconSize, color: color),
                  ]
              )
          ),
          highlightColor: Theme.of(context).highlightColor,
          splashColor: Theme.of(context).splashColor,
          radius: Material.defaultSplashRadius,
          onTap: () => onTap(),
        )
    );
  }
}