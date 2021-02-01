import 'package:app/di/http_client.dart';
import 'package:app/di/injector_provider.dart';
import 'package:app/models/kit/kit_configuration.dart';
import 'package:app/repositories/api/endpoints.dart';

class KitsApi {

  /// injecting dio instance
  final HttpClient _http = inject<HttpClient>();

  /// Returns list of configuration of a kit in response
  Future<KitConfiguration> getConfiguration(String kitSerial) async {
    try {
      final res = await _http.get(Endpoints.configurationUrl.expand({'kitSerial': kitSerial}));
      return KitConfiguration.fromJson(res.data);
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