// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peripheral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Peripheral _$PeripheralFromJson(Map<String, dynamic> json) {
  return Peripheral(
    json['id'] as int,
    json['kitId'] as int,
    json['configurationId'] as int,
    json['peripheralDefinitionId'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$PeripheralToJson(Peripheral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kitId': instance.kitId,
      'configurationId': instance.configurationId,
      'peripheralDefinitionId': instance.peripheralDefinitionId,
      'name': instance.name,
    };
