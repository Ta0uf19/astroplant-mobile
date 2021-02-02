import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/aggregate_measurement.dart';
import 'package:app/models/kit/kit_configuration.dart';
import 'package:app/repositories/api/endpoints.dart';

class KitsApi {

  /// injecting dio instance
  final HttpClient _http = inject<HttpClient>();

  /// Returns list of configuration of a kit in response
  Future<List<KitConfiguration>> getConfigurations(String kitSerial) async {
    try {
      final response = await _http.get(Endpoints.configurationUrl.expand({'kitSerial': kitSerial}));

      var list = <KitConfiguration>[];
      response.data.forEach((model) =>
          list.add(KitConfiguration.fromJson(model))
      );
      return list;

    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
  /// Aggregate measurements made by a kit.
  Future<List<AggregateMeasurement>> aggregateMeasurements(String kitSerial, int peripheralId, int quantityTypeId, int configurationId, String cursor) async {
    try {
      final response = await _http.getParams(Endpoints.aggregateUrl.expand({'kitSerial': kitSerial}),
          {
            'peripheral': '$peripheralId',
            'quantityType': '$quantityTypeId',
            'configuration': '$configurationId',
            'cursor': cursor
          }
      );
      var list = <AggregateMeasurement>[];
      response.data.forEach((model) =>
          list.add(AggregateMeasurement.fromJson(model))
      );
      return list;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  /// Create a new configuration.
  void createConfiguration() async {

  }

  /// Create a kit.
  void create() async {

  }

}