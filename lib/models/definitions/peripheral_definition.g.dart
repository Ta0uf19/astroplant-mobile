// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peripheral_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeripheralDefinitions _$PeripheralDefinitionsFromJson(
    Map<String, dynamic> json) {
  return PeripheralDefinitions(
    (json['peripheralDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : PeripheralDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PeripheralDefinitionsToJson(
        PeripheralDefinitions instance) =>
    <String, dynamic>{
      'peripheralDefinitions':
          instance.peripheralDefinitions?.map((e) => e?.toJson())?.toList(),
    };

PeripheralDefinition _$PeripheralDefinitionFromJson(Map<String, dynamic> json) {
  return PeripheralDefinition(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['brand'] as String,
    json['model'] as String,
    json['symbolLocation'] as String,
    json['symbol'] as String,
    (json['expectedQuantityTypes'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PeripheralDefinitionToJson(
        PeripheralDefinition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'brand': instance.brand,
      'model': instance.model,
      'symbolLocation': instance.symbolLocation,
      'symbol': instance.symbol,
      'expectedQuantityTypes': instance.expectedQuantityTypes,
    };
