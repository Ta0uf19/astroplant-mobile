import 'package:app/components/ctoggle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CCardPeripheral extends StatelessWidget implements IToggleable<CCardPeripheral> {
  final String title;
  final String subtitle;
  final String measure;
  final String unit;

  /// The callback that is called when a button is tapped.
  final VoidCallback onPressed;

  final bool activeToggle;

  const CCardPeripheral({
    Key key,
    @required this.title,
    @required this.measure,
    @required this.unit,
    @required this.onPressed,
    this.subtitle,
    this.activeToggle = false,
  }) : super(key: key);

  CCardPeripheral copyWith({
    String title,
    String subtitle,
    String measure,
    String unit,
    void Function(int index) onPressed,
    bool activeToggle,
  }) {
    if ((title == null || identical(title, this.title)) &&
        (subtitle == null || identical(subtitle, this.subtitle)) &&
        (measure == null || identical(measure, this.measure)) &&
        (unit == null || identical(unit, this.unit)) &&
        (onPressed == null || identical(onPressed, this.onPressed)) &&
        (activeToggle == null || identical(activeToggle, this.activeToggle))) {
      return this;
    }

    return new CCardPeripheral(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      measure: measure ?? this.measure,
      unit: unit ?? this.unit,
      onPressed: onPressed ?? this.onPressed,
      activeToggle: activeToggle ?? this.activeToggle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Ink(
        width: 155,
        height: 250,
        decoration: BoxDecoration(
          gradient: activeToggle
              ? LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.5, 0.5),
                  colors: [const Color(0xff27ED76), const Color(0xff0DBF54)],
                ) : null,
          color: activeToggle ? null : Color(0xFF30363E),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.amber,
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  //color: Colors.blue,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(this.measure,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 48,
                              color:
                                  activeToggle ? Colors.black : Colors.white)),
                      Text(this.unit,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color:
                                  activeToggle ? Colors.black : Colors.white)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  //color: Colors.lightGreenAccent,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              color:
                                  activeToggle ? Colors.black : Colors.white)),
                      Text(this.subtitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color:
                                  activeToggle ? Colors.black : Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
