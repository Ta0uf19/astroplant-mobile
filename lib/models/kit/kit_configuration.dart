
import 'package:app/models/kit/peripheral.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'kit_configuration.g.dart';

@JsonSerializable(explicitToJson: true)
class KitConfiguration {

  int id;
  int kitId;
  String description;
  String controllerSymbolLocation;
  String controllerSymbol;
  bool active;
  bool neverUsed;
  List<Peripheral> peripherals;

  KitConfiguration({
    @required this.id,
    @required this.kitId,
    @required this.description,
    @required this.controllerSymbolLocation,
    @required this.controllerSymbol,
    @required this.active,
    @required this.neverUsed,
    @required this.peripherals
  });

  factory KitConfiguration.fromJson(Map<String, dynamic> json) => _$KitConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$KitConfigurationToJson(this);

  @override
  String toString() {
    return 'KitConfiguration{id: $id, kitId: $kitId, description: $description, controllerSymbolLocation: $controllerSymbolLocation, controllerSymbol: $controllerSymbol, active: $active, neverUsed: $neverUsed, peripherals: $peripherals}';
  }
}