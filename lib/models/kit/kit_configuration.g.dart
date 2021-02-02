// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitConfiguration _$KitConfigurationFromJson(Map<String, dynamic> json) {
  return KitConfiguration(
    id: json['id'] as int,
    kitId: json['kitId'] as int,
    description: json['description'] as String,
    controllerSymbolLocation: json['controllerSymbolLocation'] as String,
    controllerSymbol: json['controllerSymbol'] as String,
    active: json['active'] as bool,
    neverUsed: json['neverUsed'] as bool,
    peripherals: (json['peripherals'] as List)
        ?.map((e) =>
            e == null ? null : Peripheral.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$KitConfigurationToJson(KitConfiguration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kitId': instance.kitId,
      'description': instance.description,
      'controllerSymbolLocation': instance.controllerSymbolLocation,
      'controllerSymbol': instance.controllerSymbol,
      'active': instance.active,
      'neverUsed': instance.neverUsed,
      'peripherals': instance.peripherals?.map((e) => e?.toJson())?.toList(),
    };
