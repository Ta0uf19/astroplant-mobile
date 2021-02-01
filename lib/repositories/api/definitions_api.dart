import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/definitions/peripheral_definition.dart';

import 'endpoints.dart';

class DefinitionsApi {

  final HttpClient _http = inject<HttpClient>();


  /// List all peripheral device definitions.
  Future<PeripheralDefinitions> getPeripheralDefinitions({bool withExpectedQuantityTypes}) async {
    try {
      final response = await _http.post(Endpoints.peripheralDefinitionsUrl);
      return response.data;
    } catch(e) {
      print(e.toString());
      throw Exception('Failed to getPeripheralDefinitions');
    }
  }

  /// List all quantity types.
  Future<PeripheralDefinitions> getQuantityTypes() {

  }
}