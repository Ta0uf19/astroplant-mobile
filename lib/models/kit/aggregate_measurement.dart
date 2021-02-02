import 'package:flutter/cupertino.dart';

class AggregateMeasurement {

  String id;
  int peripheralId;
  int kitId;
  int kitConfigurationId;
  int quantityTypeId;
  String datetimeStart;
  String datetimeEnd;

  AggregateMeasurement({
    @required this.id,
    @required this.peripheralId,
    @required this.kitId,
    @required this.kitConfigurationId,
    @required this.quantityTypeId,
    @required this.datetimeStart,
    @required this.datetimeEnd,
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
      datetimeStart: map['datetimeStart'] as String,
      datetimeEnd: map['datetimeEnd'] as String,
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
    } as Map<String, dynamic>;
  }

  @override
  String toString() {
    return 'AggregateMeasurement{id: $id, peripheralId: $peripheralId, kitId: $kitId, kitConfigurationId: $kitConfigurationId, quantityTypeId: $quantityTypeId, datetimeStart: $datetimeStart, datetimeEnd: $datetimeEnd}';
  }
}