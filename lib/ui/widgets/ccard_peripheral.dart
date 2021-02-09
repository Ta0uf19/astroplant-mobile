import 'package:app/models/kit/raw_measurement.dart';
import 'package:app/ui/constants.dart';
import 'package:app/ui/widgets/ctoggle_widget.dart';
import 'package:app/utils/NumberUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CCardPeripheral extends StatelessWidget
    implements IToggleable<CCardPeripheral> {
  final String title;
  final String subtitle;
  final String unit;
  final String measure;
  final String time;
  final Stream<RawMeasurement> stream;

  /// The callback that is called when a button is tapped.
  final VoidCallback onPressed;

  final bool activeToggle;

  const CCardPeripheral(
      {Key key,
      @required this.title,
      @required this.unit,
      @required this.onPressed,
      this.measure,
      this.time,
      this.subtitle,
      this.activeToggle = false,
      this.stream})
      : super(key: key);

  @override
  CCardPeripheral copyWith({
    String title,
    String subtitle,
    String unit,
    String measure,
    String time,
    Stream<RawMeasurement> stream,
    VoidCallback onPressed,
    bool activeToggle,
  }) {
    return CCardPeripheral(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      unit: unit ?? this.unit,
      measure: measure ?? this.measure,
      time: time ?? this.time,
      stream: stream ?? this.stream,
      onPressed: onPressed ?? this.onPressed,
      activeToggle: activeToggle ?? this.activeToggle,
    );
  }

  Widget _buildMeasureWidgetFromStream() {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        RawMeasurement rawData = snapshot.data;
        if (snapshot.hasData) {
          return Column(
            children: [
              Text('(${Jiffy(rawData.dateTime).fromNow()})',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color:
                          activeToggle ? CColors.greyDark : CColors.greyLight)),
              Text('${NumberUtils.format(rawData.measure)}',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 50,
                      color: activeToggle ? CColors.black : CColors.white)),
            ],
          );
        }
        // If there is no data
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        width: 155,
        height: 250,
        decoration: BoxDecoration(
          gradient: activeToggle
              ? LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.5, 0.5),
                  colors: [CColors.cardGradient1, CColors.cardGradient2],
                )
              : null,
          color: activeToggle ? null : CColors.cardInactive,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color:
                                activeToggle ? CColors.black : CColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      measure == null
                          ? _buildMeasureWidgetFromStream()
                          : SizedBox.shrink(),
                      measure != null
                          ? Text(measure,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 48,
                                  color: activeToggle
                                      ? CColors.black
                                      : CColors.white))
                          : SizedBox.shrink(),
                      Text(unit,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: activeToggle
                                  ? CColors.black
                                  : CColors.white)),
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
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              color: activeToggle
                                  ? CColors.black
                                  : CColors.white)),
                      Text(subtitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeToggle
                                  ? CColors.black
                                  : CColors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
