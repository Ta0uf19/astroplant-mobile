// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityType _$QuantityTypeFromJson(Map<String, dynamic> json) {
  return QuantityType(
    id: json['id'] as int,
    physicalQuantity: json['physicalQuantity'] as String,
    physicalUnit: json['physicalUnit'] as String,
    physicalUnitSymbol: json['physicalUnitSymbol'] as String,
  );
}

Map<String, dynamic> _$QuantityTypeToJson(QuantityType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'physicalQuantity': instance.physicalQuantity,
      'physicalUnit': instance.physicalUnit,
      'physicalUnitSymbol': instance.physicalUnitSymbol,
    };
