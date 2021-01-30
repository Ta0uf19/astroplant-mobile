
import 'package:app/models/peripheral.dart';
import 'package:flutter/cupertino.dart';

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

  factory KitConfiguration.fromJson(Map<String, dynamic> map) {
    return KitConfiguration(
      id: map['id'] as int,
      kitId: map['kitId'] as int,
      description: map['description'] as String,
      controllerSymbolLocation: map['controllerSymbolLocation'] as String,
      controllerSymbol: map['controllerSymbol'] as String,
      active: map['active'] as bool,
      neverUsed: map['neverUsed'] as bool,
      peripherals: map['peripherals'] as List<Peripheral>
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': id,
      'kitId': kitId,
      'description': description,
      'controllerSymbolLocation':controllerSymbolLocation,
      'controllerSymbol': controllerSymbol,
      'active': active,
      'neverUsed': neverUsed,
      'peripherals': peripherals
    } as Map<String, dynamic>;
  }
}