import 'package:app/data/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/definitions/peripheral_definition.dart';
import 'package:app/models/definitions/quantity_type.dart';
import 'package:app/data/endpoints.dart';

class DefinitionsApi {

  final HttpClient _http = inject<HttpClient>();


  /// List all peripheral device definitions.
  Future<List<PeripheralDefinition>> getPeripheralDefinitions({bool withExpectedQuantityType = true}) async {
    try {
      final response = await _http.getParams(Endpoints.peripheralUrl,
          {'withExpectedQuantityTypes': withExpectedQuantityType.toString() });
      var list = <PeripheralDefinition>[];
      response.data.forEach((model) =>
          list.add(PeripheralDefinition.fromJson(model))
      );
      return list;
    } catch(e) {
      print(e.toString());
      throw Exception('Failed to get peripheral definitions');
    }
  }

  /// List all quantity types.
  Future<List<QuantityType>> getQuantityTypes() async {
    try {
      final response = await _http.get(Endpoints.quantityTypesUrl);
      var list = <QuantityType>[];
      response.data.forEach((model) =>
          list.add(QuantityType.fromJson(model))
      );
      return list;

    } catch(e) {
      print(e.toString());
      throw Exception('Failed to get quantity types');
    }
  }
}