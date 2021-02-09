import 'package:flutter/cupertino.dart';

class RawMeasurement {

  String kitSerial;
  int peripheralId;
  int quantityTypeId;
  DateTime dateTime;
  double measure;
  String unitSymbol;
  String title;
  String subtitle;

  RawMeasurement({
    @required this.peripheralId,
    @required this.quantityTypeId,
    this.kitSerial,
    this.dateTime,
    this.measure,
    this.title,
    this.subtitle,
    this.unitSymbol
  });

  factory RawMeasurement.fromJson(Map<String, dynamic> map) {
    return RawMeasurement(
      kitSerial: map['kitSerial'] as String,
      peripheralId: map['peripheral'] as int,
      quantityTypeId: map['quantityType'] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['datetime']),
      measure: map['value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'kitSerial': kitSerial,
      'peripheralId': peripheralId,
      'quantityTypeId': quantityTypeId,
      'dateTime': dateTime,
      'value': measure,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'RawMeasurement{kitSerial: $kitSerial, peripheralId: $peripheralId, quantityTypeId: $quantityTypeId, dateTime: $dateTime, measure: $measure, unitSymbol: $unitSymbol, title: $title, subtitle: $subtitle}';
  }
}