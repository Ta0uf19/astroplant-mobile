import 'package:json_annotation/json_annotation.dart';
part 'peripheral_definition.g.dart';

@JsonSerializable(explicitToJson: true)
class PeripheralDefinitions {
  List<PeripheralDefinition> peripheralDefinitions;

  PeripheralDefinitions(List<PeripheralDefinition> peripheralDefinitions):
        peripheralDefinitions = peripheralDefinitions ?? <PeripheralDefinition>[];

  factory PeripheralDefinitions.fromJson(Map<String, dynamic> json) => _$PeripheralDefinitionsFromJson(json);
  Map<String, dynamic> toJson() => _$PeripheralDefinitionsToJson(this);
}

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

}