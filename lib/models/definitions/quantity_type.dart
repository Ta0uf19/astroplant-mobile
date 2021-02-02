import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantity_type.g.dart';

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

  @override
  String toString() {
    return 'QuantityType{id: $id, physicalQuantity: $physicalQuantity, physicalUnit: $physicalUnit, physicalUnitSymbol: $physicalUnitSymbol}';
  }
}