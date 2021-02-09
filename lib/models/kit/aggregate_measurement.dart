import 'package:flutter/cupertino.dart';

class AggregateMeasurement {

  String id;
  int peripheralId;
  int kitId;
  int kitConfigurationId;
  int quantityTypeId;
  DateTime datetimeStart;
  DateTime datetimeEnd;

  // values
  double average;
  double count;
  double maximum;
  double minimum;

  AggregateMeasurement({
    @required this.id,
    @required this.peripheralId,
    @required this.kitId,
    @required this.kitConfigurationId,
    @required this.quantityTypeId,
    @required this.datetimeStart,
    @required this.datetimeEnd,
    @required this.average,
    @required this.count,
    @required this.maximum,
    @required this.minimum,
  });

  /// Dart has no reflection, there is no library that serialization/deserialization
  /// We can use json_serializable, build_runner to generate this boilerplate code
  factory AggregateMeasurement.fromJson(Map<String, dynamic> map) {
    return AggregateMeasurement(
      id: map['id'] as String,
      peripheralId: map['peripheralId'] as int,
      kitId: map['kitId'] as int,
      kitConfigurationId: map['kitConfigurationId'] as int,
      quantityTypeId: map['quantityTypeId'] as int,
      datetimeStart: DateTime.parse(map['datetimeStart']),
      datetimeEnd: DateTime.parse(map['datetimeEnd']),
      average: map['values']['average'] as double,
      count: map['values']['count'] as double,
      maximum: map['values']['maximum'] as double,
      minimum: map['values']['minimum'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': id,
      'peripheralId': peripheralId,
      'kitId': kitId,
      'kitConfigurationId': kitConfigurationId,
      'quantityTypeId': quantityTypeId,
      'datetimeStart': datetimeStart,
      'datetimeEnd': datetimeEnd,
      'average': average,
      'count': count,
      'maximum': maximum,
      'minimum': minimum,
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'AggregateMeasurement{id: $id, peripheralId: $peripheralId, kitId: $kitId, kitConfigurationId: $kitConfigurationId, quantityTypeId: $quantityTypeId, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd, average: $average, count: $count, maximum: $maximum, minimum: $minimum}';
  }

}