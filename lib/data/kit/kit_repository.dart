
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/aggregate_measurement.dart';
import 'package:app/models/kit/kit_configuration.dart';

import 'kits_api.dart';

class KitRepository {

    final KitsApi _api = inject<KitsApi>();

    /// Returns list of configuration of a kit in response
    Future<List<KitConfiguration>> getConfigurations(String kitSerial) async {
        return await _api.getConfigurations(kitSerial);
    }

    /// Aggregate measurements made by a kit.
    Future<List<AggregateMeasurement>> aggregateMeasurements(String kitSerial,
        {int peripheralId,
      int quantityTypeId,
      int configurationId,
      String cursor}) async {

        return await _api.aggregateMeasurements(kitSerial, peripheralId, quantityTypeId, configurationId, cursor);
    }
}