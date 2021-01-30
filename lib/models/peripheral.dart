import 'package:flutter/cupertino.dart';

class Peripheral {
  int id;
  int kitId;
  int configurationId;
  int peripheralDefinitionId;
  String name;

  Peripheral({
    @required this.id,
    @required this.kitId,
    @required this.configurationId,
    @required this.peripheralDefinitionId,
    @required this.name,
  });

  factory Peripheral.fromJson(Map<String, dynamic> map) {
    return Peripheral(
      id: map['id'] as int,
      kitId: map['kitId'] as int,
      configurationId: map['configurationId'] as int,
      peripheralDefinitionId: map['peripheralDefinitionId'] as int,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': id,
      'kitId': kitId,
      'configurationId': configurationId,
      'peripheralDefinitionId': peripheralDefinitionId,
      'name': name,
    } as Map<String, dynamic>;
  }
}