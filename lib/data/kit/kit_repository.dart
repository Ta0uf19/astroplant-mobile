import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/aggregate_measurement.dart';
import 'package:app/models/kit/kit_configuration.dart';
import 'package:flutter/cupertino.dart';

import 'kits_api.dart';

class KitRepository {
  final KitsApi _api = inject<KitsApi>();

  /// Returns list of configuration of a kit in response
  Future<List<KitConfiguration>> getConfigurations(String kitSerial) async {
    return await _api.getConfigurations(kitSerial);
  }

  /// Aggregate measurements made by a kit.
  Future<List<AggregateMeasurement>> aggregateMeasurements(String kitSerial,
      {@required int peripheralId,
      @required int quantityTypeId,
      int configurationId,
      String cursor}) async {
    return await _api.aggregateMeasurements(
        kitSerial, peripheralId, quantityTypeId, configurationId, cursor);
  }

  /// Update the configuration
  /// return false if the update failed else return true
  Future<bool> updateConfiguration(int configurationId,
      {String description,
      String controllerSymbolLocation,
      String controllerSymbol,
      List<Object> controlRules,
      bool active}) async {
    return await _api.updateConfiguration(configurationId, description,
        controllerSymbolLocation, controllerSymbol, controlRules, active);
  }

  Future<KitConfiguration> addConfiguration(String description, String kitSerial) async {
    return await _api.addConfiguration(description, kitSerial);
  }
}
