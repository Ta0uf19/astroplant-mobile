import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantity_type.g.dart';

@JsonSerializable(explicitToJson: true)
class QuantityTypes {
  List<QuantityType> quantityTypes;

  QuantityTypes(List<QuantityType> quantityTypes):
        quantityTypes = quantityTypes ?? <QuantityType>[];

  factory QuantityTypes.fromJson(Map<String, dynamic> json) => _$QuantityTypesFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityTypesToJson(this);
}

@JsonSerializable()
class QuantityType {
  int id;
  String physicalQuantity;
  String physicalUnit;
  String physicalUnitSymbol;

  QuantityType({
    @required this.id,
    @required this.physicalQuantity,
    @required this.physicalUnit,
    @required this.physicalUnitSymbol,
  });

  factory QuantityType.fromJson(Map<String, dynamic> json) => _$QuantityTypeFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityTypeToJson(this);
}