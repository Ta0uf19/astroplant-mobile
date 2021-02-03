import 'package:flutter/cupertino.dart';

class RawMeasurement {

  String kitSerial;
  int peripheralId;
  int quantityTypeId;
  DateTime dateTime;
  double value;

  RawMeasurement({
    @required this.kitSerial,
    @required this.peripheralId,
    @required this.quantityTypeId,
    @required this.dateTime,
    @required this.value,
  });

  factory RawMeasurement.fromJson(Map<String, dynamic> map) {
    return RawMeasurement(
      kitSerial: map['kitSerial'] as String,
      peripheralId: map['peripheral'] as int,
      quantityTypeId: map['quantityType'] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['datetime']),
      value: map['value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'kitSerial': kitSerial,
      'peripheralId': peripheralId,
      'quantityTypeId': quantityTypeId,
      'dateTime': dateTime,
      'value': value,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'RawMeasurement{kitSerial: $kitSerial, peripheralId: $peripheralId, quantityTypeId: $quantityTypeId, dateTime: $dateTime, value: $value}';
  }
}