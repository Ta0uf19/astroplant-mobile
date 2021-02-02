import 'package:json_annotation/json_annotation.dart';
part 'peripheral_definition.g.dart';

@JsonSerializable()
class PeripheralDefinition {
  int id;
  String name;
  String description;
  String brand;
  String model;
  String symbolLocation;
  String symbol;
  List<int> expectedQuantityTypes;

  PeripheralDefinition(this.id, this.name, this.description, this.brand,
      this.model, this.symbolLocation, this.symbol, this.expectedQuantityTypes);

  factory PeripheralDefinition.fromJson(Map<String, dynamic> json) => _$PeripheralDefinitionFromJson(json);
  Map<String, dynamic> toJson() => _$PeripheralDefinitionToJson(this);

  @override
  String toString() {
    return 'PeripheralDefinition{id: $id, name: $name, description: $description, brand: $brand, model: $model, symbolLocation: $symbolLocation, symbol: $symbol, expectedQuantityTypes: $expectedQuantityTypes}';
  }
}