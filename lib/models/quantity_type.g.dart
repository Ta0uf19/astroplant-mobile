// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityTypes _$QuantityTypesFromJson(Map<String, dynamic> json) {
  return QuantityTypes(
    (json['quantityTypes'] as List)
        ?.map((e) =>
            e == null ? null : QuantityType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuantityTypesToJson(QuantityTypes instance) =>
    <String, dynamic>{
      'quantityTypes':
          instance.quantityTypes?.map((e) => e?.toJson())?.toList(),
    };

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
