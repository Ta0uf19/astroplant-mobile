
import 'package:flutter/cupertino.dart';

class KitConfiguration {

  int id;
  int kitId;
  String description;
  String controllerSymbolLocation;
  String controllerSymbol;
  bool active;
  bool neverUsed;

  KitConfiguration({
    @required this.id,
    @required this.kitId,
    @required this.description,
    @required this.controllerSymbolLocation,
    @required this.controllerSymbol,
    @required this.active,
    @required this.neverUsed,
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
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'kitId': this.kitId,
      'description': this.description,
      'controllerSymbolLocation': this.controllerSymbolLocation,
      'controllerSymbol': this.controllerSymbol,
      'active': this.active,
      'neverUsed': this.neverUsed,
    } as Map<String, dynamic>;
  }
}